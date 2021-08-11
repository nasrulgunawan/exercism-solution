defmodule Raindrops do
  @list [3, 5, 7]
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    cond do
      not_contain_prime_factor?(number) -> Integer.to_string(number)
      true -> Enum.map(@list, &(process(number, &1))) |> Enum.join
    end
  end

  defp process(number, n) do
    cond do
      is_valid?(number, 3) && n == 3 -> "Pling"
      is_valid?(number, 5) && n == 5 -> "Plang"
      is_valid?(number, 7) && n == 7 -> "Plong"
      true -> ""
    end
  end

  defp is_valid?(number, prime_factor) do
    rem(number, prime_factor) == 0
  end

  defp not_contain_prime_factor?(number) do
    Enum.all?(@list, &(!is_valid?(number, &1)))
  end
end
