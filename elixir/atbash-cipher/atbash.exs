defmodule Atbash do
  @chars Enum.zip(?a..?z, ?z..?a) ++ Enum.zip(?0..?9, ?0..?9)
  @cipher @chars |> Enum.into(%{})

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    plaintext
    |> String.downcase
    |> to_char_list
    |> Enum.map(&(@cipher[&1]))
    |> Enum.reject(&(&1 == nil))
    |> Enum.chunk(5, 5, [])
    |> Enum.join(" ")
  end
end
