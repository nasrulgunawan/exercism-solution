defmodule Raindrops do
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
      modulo(number, 3) -> "Pling"
      modulo(number, 5) -> "Plang"
      modulo(number, 7) -> "Plong"
    end
  end

  defp modulo(number, prime_factor) do
    rem(number, prime_factor) === 0
  end

  defp not_contain_prime_factor?(number) do
    !(modulo(number, 3) && modulo(number, 5) && modulo(number, 7))
  end
end
