defmodule Blog.Application do
  @moduledoc """
  The Blog Application Service.

  The blog system business domain lives in this application.

  Exposes API to clients such as the `BlogWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Blog.Repo, []),
    ], strategy: :one_for_one, name: Blog.Supervisor)
  end
end
