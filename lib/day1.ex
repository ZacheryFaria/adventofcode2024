defmodule Day1 do
  def load_file() do
    {:ok, res} = File.read("inputs/day1/puzzle1/input.txt")
    res
  end

  def is_digit(x) do
    case Integer.parse(x) do
      {_, _} -> true
      :error -> false
    end
  end

  # assumes they are already graphemes ["a", "b", "c"]
  @doc """
  ## Examples
      iex> Day1.get_first_digit_from_line(["a", "b", "1", "2", "c"])
      1

      iex> Day1.get_first_digit_from_line(["2"])
      2
  """
  def get_first_digit_from_line(line) do
    Enum.filter(line, &is_digit/1) |> hd |> String.to_integer()
  end

  @doc """
  ## Examples
      iex> Day1.get_number_from_line("hello1world2")
      12

      iex> Day1.get_number_from_line("1wha2olaskd4s")
      14

      iex> Day1.get_number_from_line("2")
      22
  """
  def get_number_from_line(line) do
    graphemes = String.graphemes(line)

    first = get_first_digit_from_line(graphemes)
    second = get_first_digit_from_line(Enum.reverse(graphemes))

    first * 10 + second
  end

  @doc """
  ## Examples
      iex> Day1.sum_all_lines("1abc2
      ...> pqr3stu8vwx
      ...> a1b2c3d4e5f
      ...> treb7uchet")
      142
  """
  def sum_all_lines(lines) do
    lines
    |> String.split()
    |> Enum.map(&get_number_from_line/1)
    |> Enum.sum()
  end

  def solve_ex1() do
    data = load_file()

    sum_all_lines(data)
  end
end
