defmodule Frequency do
  @doc """
  Count word frequency in parallel.

  Returns a dict of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: Map
  def frequency(texts, workers) do
    pids = start_workers(workers)
    counts = pcount(texts, pids)
    stop_workers(pids)
    counts
  end

  defp pcount(texts, pids) do
    distribute(texts, pids)
    aggregate(texts)
  end

  defp distribute(texts, pids) do
    texts
    |> Enum.map(fn text ->
      Regex.replace(~r/[\s\d,]/, text, "")
    end)
    |> Enum.map(&String.downcase/1)
    |> Enum.zip(Stream.cycle(pids))
    |> Enum.each(fn { text, pid } ->
      send(pid, { :count, text })
    end)
  end

  defp aggregate(texts) do
    texts
    |> Enum.map(fn _ ->
      receive do
        result -> result
      end
    end)
    |> Enum.reduce(%{}, fn x, acc ->
      Map.merge(acc, x, fn _k, v1, v2 -> v1 + v2 end)
    end)
  end

  defp start_counter(_worker) do
    parent = self
    spawn(fn -> counter(parent) end)
  end

  defp counter(parent) do
    receive do
      { :count, text } ->
        send(parent, count(text))
        counter(parent)
      :stop ->
        exit(:normal)
    end
  end

  defp count(text) do
    text
    |> String.graphemes
    |> Enum.reduce(%{}, fn x, acc ->
      Map.update(acc, x, 1, &(&1 + 1))
    end)
  end

  defp start_workers(workers) do
    Enum.map(1..workers, &start_counter/1)
  end

  defp stop_workers(pids) do
    Enum.each(pids, fn pid -> send(pid, :stop) end)
  end
end
