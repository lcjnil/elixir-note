map = %{ name: "lcj", like: "programming", where: "Beijing" }
IO.inspect Map.keys map
IO.inspect Map.values map
IO.inspect map[:name]
IO.inspect map.like
IO.inspect Map.drop map, [ :where, :like ]
IO.inspect Map.put map, :also_like, "Javascript"
{ name, newMap } = Map.pop map, :name
IO.inspect { name, newMap }
