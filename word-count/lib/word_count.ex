defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
      |> String.downcase
      |> split
      |> Enum.frequencies
  end

  def split(sentence) do
    String.split(sentence, ~r/[^[:alnum:]\-]/u, trim: true)
  end
end
