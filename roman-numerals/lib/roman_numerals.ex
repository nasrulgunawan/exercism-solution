defmodule RomanNumerals do
  @roman_mapping [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    to_roman(number)
  end

  defp to_roman(0), do: ""

  defp to_roman(number) do
    {base_number, roman} = Enum.find(@roman_mapping, fn {base_number, _roman} ->
      number >= base_number
    end)

    roman <> to_roman(number - base_number)
  end
end
