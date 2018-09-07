defmodule GenCounter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(GenCounter.Producer, [0]),
      worker(GenCounter.ProducerConsumer, []),
      worker(GenCounter.Consumer, [], id: :a),
      worker(GenCounter.Consumer, [], id: :b),
      worker(GenCounter.Consumer, [], id: :c)
    ]

    opts = [strategy: :one_for_one, name: GenCounter.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
