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

## Structs

```elixir
defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end

# 通过 $Subscriber 访问，或者生成一个新的
s1 = %Subscriber{name: "hello"}
# 可以通过 `.` 来访问
IO.inspect s1.name
```

定义一个结构体只需要给一个 map 套上一个模块，相当于给 map 取了一个名字。

可以在同模块封装一些方法进去（虽然感觉没有什么意义……）

结构体也可以层叠，然后会有 `put_in` 和 `update_in` 这样的宏方便进行深度修改。但是这些宏都是编译器展开的，无法做到动态加载……所以可以修改第二个参数为一个原子列表，就可以用了（很无聊的设定）
