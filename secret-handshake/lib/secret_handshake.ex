defmodule SecretHandshake do
  use Bitwise

  @mapping %{
    0b0001 => "wink",
    0b0010 => "double blink",
    0b0100 => "close your eyes",
    0b1000 => "jump"
  }

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    @mapping
      |> Map.keys
      |> Enum.filter(&(flag?(code, &1)))
      |> Enum.map(&(@mapping[&1]))
      |> reverse(code)
  end

  defp flag?(code, flag), do: (code &&& flag) === flag

  defp reverse(handshake, code) do
    if flag?(code, 0b10000),
      do: Enum.reverse(handshake),
      else: handshake
  end
end
