defmodule Deadwood.Food do

  @food [
    %{name: "Hamburger", cost: 12.0},
    %{name: "Hot dog", cost: 5.0},
  ]

  def start_link,
    do: Agent.start_link(fn -> @food end, name: __MODULE__)

  def get,
    do: Agent.get(__MODULE__, &(&1))

  def put(params),
    do: Agent.update(__MODULE__, fn(food) -> [params|food] end)

end
