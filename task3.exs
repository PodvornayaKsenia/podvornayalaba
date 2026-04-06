defmodule Task3 do
  def proverka(n) do
    digits = Integer.digits(n)
    sum = Enum.sum(digits)
    proizv = Enum.product(digits)
    proizv > sum
  end

  def main(args) do
    IO.puts("введите N:")
    n = IO.read(:line) |> String.trim() |> String.to_integer()
    IO.puts("введите N  чисел:")
    numbers = for _ <- 1..n do
      IO.read(:line) |> String.trim() |> String.to_integer()
    end
    result = Enum.filter(numbers, &proverka/1)
    output = if Enum.empty?(result), do: "не найдено", else: Enum.join(result, " ")
    IO.puts(output)

    """
    {input, output} = if "--file" in args do
      {:ok, f_in} = File.open("input.txt", [:read])
      {:ok, f_out} = File.open("output.txt", [:write])
      {f_in, f_out}
    else
      {:stdio, :stdio}
    end
    n = IO.read(input, :line) |> String.trim() |> String.to_integer()
    numbers = for _ <- 1..n do
      IO.read(input, :line) |> String.trim() |> String.to_integer()
    end
    result = Enum.filter(numbers, &proverka/1)
    output = if Enum.empty?(result), do: "не найдено", else: Enum.join(result, " ")
    IO.puts(output, output)
    if input != :stdio, do: File.close(input)
    if output != :stdio, do: File.close(output)
    """
  end
end

System.argv() |> Task3.main()
