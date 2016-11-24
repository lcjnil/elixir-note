# Elixir 笔记四

`[1 | [2 | [ 3 | [ ] ] ] ]` 等价于 `[1, 2, 3]`。可以把 `|` 想象成管道。
`[head | tail] = [1, 2, 3]` 会得到 `head = 1` 和 `tail = [2, 3]`

使用这种方法可以遍历每一个元素，比如一个平方函数：
```
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

 # Reduce
 def reduce([], value, _func), do: value
 def reduce([ head | tail], value, func), do: reduce(tail, func.(value, head), func)

 def mapSum([], _func), do: 0
 def mapSum([ head | tail], func), do: func.(head) + mapSum(tail, func)

 # Max
 def max([]), do: 0
 def max([head]), do: head
 def max([ head | tail]), do: bigger(head, max(tail))

 defp bigger(a, b) when a > b, do: a
 defp bigger(a, b) when a <= b, do: b

end

```

## 列表的列表

假设一个列表中的每一项都是列表，过滤出第二项为 27 的函数

```
defmodule Weather do
  # test data
  def test_data do
    [
        [1, 2, 3, 4],
        [1, 27, 2, 34],
        [2, 27, 3, 12]
    ]
  end

  def for_location_27([]), do: []
  def for_location_27([ [time, 27, location, rain] | tail ]) do
   [ [time, 27, location, rain] | for_location_27(tail) ]
  end
  def for_location_27([ _ | tail]) do
    for_location_27(tail)
  end

  # 不关心头部其他字段是什么，所以可以继续往下写：
  def for_location_27_new([]), do: []
  def for_location_27_new([ head = [ _, 27, _, _ ] | tail ]), do: [ head | for_location_27_new(tail) ]
  def for_location_27_new([ _ | tail ]), do: for_location_27_new(tail)
end
```
