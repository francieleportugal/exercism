defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do

    normalize(sentence)
    |> String.split()
    |> Enum.frequencies()
  end

  @doc """
  Normalize a setence.
  """
  @spec count(String.t()) :: String.t()
  defp normalize(sentence) do
    sentenceNormalized = Regex.replace(~r"(*UTF)[^\w\s\-]", sentence, "")
    sentenceNormalized = Regex.replace(~r/_/, sentenceNormalized, " ")
    String.downcase(sentenceNormalized)
  end
end
