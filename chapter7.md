# Strings and Binaries

- 可以放 unicode 字符
- 可以通过 #{} 插入变量（模板字符串）

双引号的 string 是 strings（同时也是 binaries），单引号的是字符列表


## heredocs
```
IO.puts "start"
IO.write "
  my
  string
"
IO.puts "end"


IO.puts "start"
IO.write """
  my
  string
  """ # 这里的缩进很重要
IO.puts "end"
```



