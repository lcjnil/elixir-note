# Elixir 笔记二

## 匿名函数

匿名函数由 fn 开始，end 结束，一般为：

```
fn
  parameter-list -> body
  parameter-list -> body
end
```

定义的匿名函数通过`.` 调用，而命名函数则不用
```
> sum = fn (a, b) -> a + b end
> sum.(1, 2)
```

函数的参数并不是赋值，而是模式匹配。

并且可以一个函数具有多个函数体，通过模式匹配找到调用的函数体，比如：

```
fizz_buzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, a) -> a
end

IO.puts fizz_buzz.(0, 0, 1)
IO.puts fizz_buzz.(0, 1, 1)
IO.puts fizz_buzz.(1, 0, 1)IO.puts fizz_buzz.(1, 1, "hahaha")

```

函数也具有闭包：
```
hello = fn name -> fn -> "Hello #{name}" end end 

IO.puts hello.('NiL').()

```

`&`运算符会把后面的表达式转成函数，而占位符`&1`则对应接下来的函数参数，比如：

```
sum = &(&1 + &2)
```

## 模块与命名函数

可以用模块把一堆函数包起来，比如

```
defmodule Times do
  def double(n) do
    n * 2
  end
end

$ iex times.exs
> Times.double 4
```
上述是下面的语法糖：

```
def newDouble(n), do: n * 2
def triple(n), do: (
  n * n * n
)
```
但是现在一般只在单行代码中用 do: 的形式。

## 模式匹配
命名函数也支持多个函数体，但是需要写多个函数，看起来像是在定义多个函数。调用一个命名函数的时候，会尝试一个一个匹配。比如：
```
defmodule Factorial do 
  def of(0), do: 1 
  def of(n), 
  do: n * of(n - 1)
end
```

## 哨兵
可以通过哨兵来加强对一个模式的匹配（不过只支持一个子集），比如：
```
defmodule Factorial do 
  def of(0), do: 1 
  def of(n) when n > 0 do
    n * of(n - 1)
  end
end
```

## 默认参数

可以通过 `\\` 来给一个默认参数（有点奇怪）

## 私有函数

通过 `defp` 定义一个模块内的私有函数。

## `|>` 管道运算符

`|>` 管道运算符，会把左边的表达式的结果，作为第一个参数传递给右边的函数调用，然后继续作为第一个参数往下传。
```
(1..10)
  |> Enum.map(&(&1 * &1))
  |> Enum.filter(&(&1 < 40))
```

管道中，函数必须使用括号。
