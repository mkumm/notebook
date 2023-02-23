defmodule Sequence.Server do
  use GenServer

  def init({initial_number, plus_number}) do
    IO.inspect("init")
    {:ok, initial_number + plus_number}
  end

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end

  def handle_call({:reset, n}, _from, _state) do
    {:reply, n, n}
  end
end
