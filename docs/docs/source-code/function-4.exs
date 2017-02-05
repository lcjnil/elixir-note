prefix = fn prefix_string -> fn str -> "#{prefix_string} #{str}" end end

mrs = prefix.("Mrs")
IO.puts mrs.("NiL")

IO.puts prefix.("Elixir").("Rocks")


