defmodule MyList do
  def square([]), do: []
  def square([ head | tail ]), do: [head * head | square(tail)]
  
  # 通过基本的遍历就可以写出一个 map 函数
  def map([], _func), do: []
  def map([ head | tail], func), do: [func.(head) | map(tail, func)]
  
  # sum
  def sum(list), do: _sum(list, 0)
  
  defp _sum([], total), do: total
  defp _sum([ head | tail], total), do: _sum(tail, total + head)
  
  def mySum([]), do: 0
  def mySum([head | tail]), do: head + mySum(tail)
  
  def reduce([], value, _func), do: value
  def reduce([ head | tail], value, func), do: reduce(tail, func.(value, head), func)
  
  def mapSum([], _func), do: 0
  def mapSum([ head | tail], func), do: func.(head) + mapSum(tail, func)
  
  def max([]), do: 0
  def max([head]), do: head
  def max([ head | tail]), do: bigger(head, max(tail))
  
  defp bigger(a, b) when a > b, do: a
  defp bigger(a, b) when a <= b, do: b
end