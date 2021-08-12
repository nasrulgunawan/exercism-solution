defmodule Bob do
  def hey(sentence) do
    cond do
      silence?(sentence) -> "Fine. Be that way!"
      yelling_question?(sentence) -> "Calm down, I know what I'm doing!"
      question?(sentence) -> "Sure."
      yelling?(sentence) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp normalize(sentence) do
    sentence |> String.trim
  end

  defp question?(sentence) do
    normalize(sentence) |> String.ends_with?("?")
  end

  defp yelling?(sentence) do
    has_letters?(sentence) && all_caps?(sentence)
  end

  defp silence?(sentence) do
    normalize(sentence) == ""
  end

  defp yelling_question?(sentence) do
    yelling?(sentence) && question?(sentence)
  end

  defp has_letters?(sentence) do
    String.upcase(sentence) != String.downcase(sentence)
  end

  defp all_caps?(sentence) do
    sentence == String.upcase(sentence)
  end
end
