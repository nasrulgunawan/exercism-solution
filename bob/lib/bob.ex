defmodule Bob do
  def hey(sentence) do
    cond do
      question?(sentence) -> "Sure."
      silence?(sentence) -> "Fine. Be that way!"
      yell?(sentence) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp normalize(sentence) do
    sentence
      |> String.replace(~r/,\s[^[:alpha:][:blank:]['?']]/u, "")
      |> String.trim
  end

  defp question?(sentence) do
    String.last(normalize(sentence)) == "?"
  end

  defp yell?(sentence) do
    String.upcase(normalize(sentence)) === normalize(sentence)
  end

  defp silence?(sentence) do
    normalize(sentence) == ""
  end
end
