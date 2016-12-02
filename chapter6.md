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