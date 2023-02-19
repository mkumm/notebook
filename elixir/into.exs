for x <- ~w/ cat dog /, into: %{}, do: {x, String.upcase(x)}
# %{"cat" => "CAT", "dog" => "DOG"}

for x <- ~w/ cat dog /, into: Map.new(), do: {x, String.upcase(x)}
# %{"cat" => "CAT", "dog" => "DOG"}
