# Control Flow

## if and unless

`if 1 === 1, do: :true, else: :false`

```
if 1 === 1 do
  :true
else
  :false
end    
```

## cond

```
cond do
  case1 === true ->
    :xxx
  case2 === true ->
    :yyy
end    
```

## case

```
case File.open("case.ex") do
{ :ok, file } ->
  IO.puts "First line: #{IO.read(file, :line)}"
{ :error, reason } -> 
  IO.puts "Failed to open file: #{reason}"  
end
```


