defmodule Chop do
  def guess(x, a..b) do
    guessY(x, a..b, 0)
  end

  def guessY(x, a..b, 0) do
    guessY(x, a..div(a + b, 2), div(a + b, 2))
  end
  
  def guessY(x, a.._, y) when y > x do
    IO.puts "Is it #{y}"
    guessY(x, a..y, div(a + y, 2))
  end

  def guessY(x, _..b, y) when y < x do
    IO.puts "Is it #{y}"
    guessY(x, y..b, div(y + b, 2))
  end

  def guessY(x, _.._, x) do
    IO.puts x
  end
end
