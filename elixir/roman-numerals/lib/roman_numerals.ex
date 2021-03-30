defmodule RomanNumerals do
  @roman_numerals %{
    1000 => "M",
    900  => "CM",
    800  => "DCCC",
    700  => "DCC",
    600  => "DC",
    500  => "D",
    400  => "CD",
    300  => "CCC",
    200  => "CC",
    100  => "C",
    90   => "XC",
    80   => "LXXX",
    70   => "LXX",
    60   => "LX",
    50   => "L",
    40   => "XL",
    30   => "XXX",
    20   => "XX",
    10   => "X",
    9    => "IX",
    8    => "VIII",
    7    => "VII",
    6    => "VI",
    5    => "V",
    4    => "IV",
    3    => "III",
    2    => "II",
    1    => "I"
  }

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()

  def numeral(0), do: ""

  def numeral(number) do
    number_list = number
    |> to_string()
    |> String.reverse()
    |> String.codepoints()
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index()
    |> Enum.reverse()

    result = for {key, val} <- number_list, do:
      Map.get(@roman_numerals, key * trunc(String.to_float("1.0e#{val}")))

    Enum.join(result)
  end
end
