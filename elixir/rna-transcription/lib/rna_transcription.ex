defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    complement = %{
      'A' => 'U',
      'C' => 'G',
      'T' => 'A',
      'G' => 'C'
    }

    Enum.reduce(dna, [], fn (base, acc) ->
      acc ++ Map.get(complement, [base])
    end)

  end
end
