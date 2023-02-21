defmodule Spawn1 do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello, #{msg}"})
    end
  end
end

defmodule Spawn4 do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Helloooo, #{msg}"})
        greet()
    end
  end
end

pid = spawn(Spawn1, :greet, [])
send(pid, {self(), "World!"})

pid4 = spawn(Spawn4, :greet, [])
send(pid, {self(), "World!"})

receive do
  {:ok, message} ->
    IO.puts(message)
end

send(pid4, {self(), "Mike!"})

receive do
  {:ok, message} ->
    IO.puts(message)
after
  500 ->
    IO.puts("Bye bye!")
end
