defmodule Link1 do
  import :timer, only: [ sleep: 1]

  def sad_function do
    IO.inspect("sad function called")
    sleep 500
    exit(:boom)
  end

  def run do
    spawn(Link1, :sad_function, [])
    receive do
      msg ->
        IO.puts "Message Received: #{inspect msg}"
      after 1000 ->
        IO.puts "I see and saw nothing"
    end
  end
end
