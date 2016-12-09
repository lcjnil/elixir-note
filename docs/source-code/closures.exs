hello = fn name -> fn -> "Hello #{name}" end end

IO.puts hello.('NiL').()
