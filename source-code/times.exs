defmodule Times do
  def double(n) do
    n * 2
  end
  
  def newDouble(n), do: n * 2
  def triple(n), do: (
    n * n * n
  )


  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n - 1) + fib(n - 2)
end
