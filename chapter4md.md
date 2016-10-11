# Elixir 笔记四

`[1 | [2 | [ 3 | [ ] ] ] ]` 等价于 `[1, 2, 3]`。可以把 `|` 想象成管道。
`[head | tail] = [1, 2, 3]` 会得到 `head = 1` 和 `tail = [2, 3]`

使用这种方法可以遍历每一个元素，比如一个平方函数：
```
defmodule MyList do
 def square([]), do: []
 def square([ head | tail ]), do: [head * head | square(tail)]

 def map([], _func), do: []
 def map([ head | tail], func), do: [func.(head) | map(tail, func)]
end
```