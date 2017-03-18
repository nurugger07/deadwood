defmodule Deadwood do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Deadwood.Saloon, [])
    ]

    opts = [strategy: :one_for_one, name: Deadwood.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
