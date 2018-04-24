defmodule Bank.EventHandlers do
  @moduledoc false

  defmodule AccountBalanceHandler do
    @moduledoc false
    use Commanded.Event.Handler, name: __MODULE__
    alias Bank.Events.AccountOpened

    def init do
      with {:ok, _pid} <- Agent.start_link(fn -> 0 end, name: __MODULE__) do
        :ok
      end
    end

    def handle(%AccountOpened{initial_balance: initial_balance}, _metadata) do
      Agent.update(__MODULE__, fn _ -> initial_balance end)
    end

    def current_balance do
      Agent.get(__MODULE__, fn balance -> balance end)
    end
  end
end
