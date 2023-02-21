defmodule Monitor1 do
  import :timer, only: [sleep: 1]

  def sad_function do
    IO.inspect("sad function called")
    sleep(500)
    exit(:boom)
  end

  def run do
    res = spawn_monitor(Monitor1, :sad_function, [])
    IO.puts(inspect(res))

    receive do
      msg ->
        IO.puts("Message Received: #{inspect(msg)}")
    after
      1000 ->
        IO.puts("I see and saw nothing")
    end
  end
end
