# Elixir 笔记5

字典（Dictionary）是把键值关联起来的类型，有两种：散列表（Map）和关键字列表（Keyword List）。

## Keywords List

```elixir
defmodule Canvas do
  @defaults [ fg: "black", bg: "white", font: "mononoki" ]
  #same as [{:fg, "black"}, {:bg, "white"}, {:font, "mononoki"}]

  def draw_text(text, options \\ []) do
    options = Keyword.merge(@defaults, options)
    IO.puts "Drawing text #{inspect(text)}"
    IO.puts "Foreground:  #{options[:fg]}"
    IO.puts "Background:  #{options[:bg]}"
    IO.puts "Font:        #{Keyword.get(options, :font)}"
    IO.puts "Pattern:     #{Keyword.get(options, :pattern, "solid")}"
    IO.puts "Style:       #{inspect Keyword.get_values(options, :style)}"
  end
end

Canvas.draw_text("hello", fg: "red", style: "italic", style: "bold")
```

可以使用 `[]` 操作符来访问关键字模块（module）


## Map

```elixir
map = %{ name: "lcj", like: "programming", where: "Beijing" }
IO.inspect Map.keys map
IO.inspect Map.values map
IO.inspect map[:name]
IO.inspect map.like
IO.inspect Map.drop map, [ :where, :like ]
IO.inspect Map.put map, :also_like, "Javascript"
{ name, newMap } = Map.pop map, :name
IO.inspect { name, newMap }

```

遍历

```elixir
people = [
  %{ name: "Grumpy", height: 1.24 },
  %{ name: "Dave", height: 1.88 },
  %{ name: "Dopey", height: 1.32 },
  %{ name: "Shaquille", height: 2.16 },
  %{ name: "Sneezy", height: 1.28 }
]

IO.inspect(for person = %{ height: height } <- people, height > 1.5, do: person)
# 将一个列表给一个 person，并过滤，输出过滤后的结果
```

可以模式匹配值，但是不能模式匹配键

Map 可以像 List 一样使用 `|` 来进行操作，但是只能更新原有的值，不能添加新键。
