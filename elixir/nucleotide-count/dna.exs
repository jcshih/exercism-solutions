defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    unless valid_strand?(strand) and valid_nucleotide?(nucleotide) do
      raise ArgumentError, "invalid nucleotide"
    end

    strand |> Enum.filter(&(&1 == nucleotide)) |> Enum.count
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: Dict.t
  def histogram(strand) do
    unless valid_strand?(strand) do
      raise ArgumentError, "invalid strand"
    end

    strand_counts = strand
    |> Enum.group_by(&(&1))
    |> Enum.map(fn {k, v} -> {k, Enum.count(v)} end)
    |> Enum.into(%{})

    Dict.merge(%{?A => 0, ?T => 0, ?C => 0, ?G => 0}, strand_counts)
  end

  @spec valid_nucleotide?(char) :: boolean
  def valid_nucleotide?(nucleotide) do
    Enum.member?(@nucleotides, nucleotide)   
  end

  @spec valid_strand?([char]) :: boolean
  def valid_strand?(strand) do
    Regex.match?(~r/^[ACGT]*$/, List.to_string(strand))   
  end
end
