defmodule Deadwood.Saloon do
  use Coyote.Client

  @text """
    <h1>The Clever Coyote</h1>
    <p>
      The monster hunted and hunted, but the buffalo had scattered without a trace. Late
      that night, when the monster returned to his lair, young warriors were waiting.
      They killed the monster, much to the relief of one small boy and all of the people
      and all of the animals.
    </p>
    <p>
      That is why the elders say it is Coyote to whom we owe the buffalo. Even today, the
      people still give thanks to clever Coyote. If it had not been for the smart head and
      warm heart of one little dog, that horrible monster would have kept all the buffalo
      for himself forever.
    </p>
  """

  routes do
    [
      {:GET, "/"}
    ]
  end

  def call({:GET, "/", _params}, _from, state),
    do: {:reply, @text, state}

end
