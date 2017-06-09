defmodule Deadwood.Menu do
  use Coyote.Client

  routes do
    [
      {:get_items, "/food"},
      {:put_item, "/food"}
    ]
  end

  def call({:get_items, "/food", _params}, _from, state),
    do: {:reply, build_response(), state}

  def call({:put_item, "/food", params}, _from, state) do
    Deadwood.Food.put(params)

    response = build_response()
    |> Map.merge(%{params: params})

    {:reply, response, state}
  end

  def build_response do
    items = Deadwood.Food.get()
    count = Enum.count(items)
    average_price = items
    |> Enum.map(&(&1.cost))
    |> Enum.sum()
    |> Kernel./(count)
    |> Float.round(2)

    %{
      average_price: average_price,
      total_items: count,
      items: items
    }
  end

end
