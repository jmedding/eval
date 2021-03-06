defmodule Eval.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build and query models.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      use Phoenix.ConnTest

      alias Eval.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import Eval.Router.Helpers

      # Added for testing with exMachina
      import Eval.Factory

      # The default endpoint for testing
      @endpoint Eval.Endpoint

      # Import the helpers in all your controller tests
      import Todos.ConnCaseHelper
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Eval.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Eval.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
