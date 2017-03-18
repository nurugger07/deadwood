defmodule Deadwood.Saloon do
  use Coyote.Client

  routes do
    [
      {:GET, "/"},
      {:GET, "/welcome"},
      {:GET, "/drink"}
    ]
  end

  def call({:GET, "/", _params}, _from, state) do
    {:reply, "Hello!", state}
  end

  def call({:GET, "/welcome", _params}, _from, state) do
    {:reply, "thank you!", state}
  end

  def call({:GET, "/drink", nil}, _from, state) do
    {:reply, "You didn't tell me what you wanted.", state}
  end


  def call({:GET, "/drink", params}, _from, state) do
    {:reply, "drink this? #{inspect params}", state}
  end

end
