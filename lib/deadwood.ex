defmodule Deadwood.Client do
  use Coyote.Client

  routes do
    [
      {:GET, "/"}
    ]
  end

  def call({:GET, "/"}, _from, state) do
    {:reply, "Hello!", state}
  end

end
