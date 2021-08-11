defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{first_line(number)}
    #{second_line(number)} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    Enum.map_join(range, &(verse(&1)))
  end

  defp bottle(n) do
    case n do
      0 -> "no more bottles"
      1 -> "1 bottle"
      _ -> "#{n} bottles"
    end
  end

  defp capitalize(n), do: bottle(n) |> String.capitalize

  defp first_line(n) do
    "#{capitalize(n)} of beer on the wall, #{bottle(n)} of beer."
  end

  defp second_line(n) do
    case n do
      0 -> "Go to the store and buy some more, #{bottle(n)}"
      1 -> "Take it down and pass it around, #{bottle(n)}"
      _ -> "Take one down and pass it around, #{bottle(n-1)}"
    end
  end
end
