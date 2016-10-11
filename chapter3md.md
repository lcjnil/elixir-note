# Elixir 笔记三

## 模块

模块内可以直接调用其他函数，而不需要使用限定名。

模块内部也可以定义模块，这个时候外部模块需要使用限定名。模块内部的定义只是语法糖，实际上模块都是在最顶层定义的，只是会通过 `.` 嵌套起来。这意味着看上去嵌套的模块实际上没什么关系。

### import

import 可以讲模块内的函数或宏引入到当前的作用域，可以减少一遍遍重复模块的名字。

```
defmodule TestImport do
 def func1 do
   List.flatten [1, [2, 3], 4]
 end

 def func2 do
 import List, only: [flatten: 1] 
   flatten [5, [6, 7], 8]
 end
end
```

### Alias

创建一个别名

### require（后面介绍）


## 模块属性

模块具有元属性（类似于面向对面里面的类变量，静态变量），定义方法为 `@name value`，只能在最顶层设定。函数内部可以访问。并且，可以在模块顶部多次复制，甚至每次都可以不一样。但是需要把它当做元数据或者配置文件来用。

```
defmodule TextAttr do
 @attr "one"
 def first, do: @attr
 @attr "two"
 def second, do: @attr
end

```

