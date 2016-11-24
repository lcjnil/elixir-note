defmodule Weather do
  # test data
  def test_data do
    [
        [1, 2, 3, 4],
        [1, 27, 2, 34],
        [2, 27, 3, 12]
    ]
  end

  def for_location_27([]), do: []
  def for_location_27([ [time, 27, location, rain] | tail ]) do
   [ [time, 27, location, rain] | for_location_27(tail) ]
  end
  def for_location_27([ _ | tail]) do
    for_location_27(tail)
  end

  def for_location_27_new([]), do: []
  def for_location_27_new([ head = [ _, 27, _, _ ] | tail ]), do: [ head | for_location_27_new(tail) ]
  def for_location_27_new([ _ | tail ]), do: for_location_27_new(tail)
end