defmodule Bob do
  def hey(sentence) do
    cond do
      question?(sentence) ->
        "Sure."
      yell?(sentence) ->
        "Woah, chill out!"
      silence?(sentence) ->
        "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  defp question?(sentence) do
    String.last(sentence) === "?"
  end

  defp yell?(sentence) do
    String.upcase(sentence) === sentence
  end

  defp silence?(sentence) do
    String.trim(sentence) === ""
  end
end
