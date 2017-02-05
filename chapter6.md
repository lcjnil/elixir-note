# Elixir 笔记六

## Enum

Enum 模块提供了一系列的算法来处理可枚举的类型。比如 `map`, `concat`, `filter` 等方法。

``` elixir
defmodule NewEnum do
  def flatten([]), do: []
  def flatten([ head | tail ]), do: flatten(head) ++ flatten(tail)
  # 技巧是，当不能被上式匹配的时候，一定不是 list 了
  def flatten(head), do: [head]
end
```

## Stream

Stream 和 Enum 不一样，不会立即计算，而是出现消费者的时候才会计算。在管道中传递时候，Enum 会创建数个中间值，但是 Stream 不会。

```
IO.puts File.open!("/usr/share/dict/words") 
    |> IO.stream(:line) 
    |> Enum.max_by(&String.length/1)
```

- Stream.cycle，接受一个可枚举类型，不停循环
- Stream.repeatedly 接受一个函数
- Stream.iterate 接受初始值，和返回下一个的函数
- Stream.unfold 接受初始值，和一个函数，函数必须返回当前值和下一个值的元组

## Comprehensions

`result = for generator or filter… [, into: value ], do: expression`

generator:

`pattern <- enumerable_thing`

如果出现了多个 filter，会是一个全排列

默认情况下会输出一个数组，但是可以借助 Collectable protocol，将数组进行转换

```
for x <- ~w{ cat dog }, into: Map.new, do: { x, String.upcase(x) }
[{"cat", "CAT"}, {"dog", "DOG"}]
```

