defmodule Bank.Aggregates do
  alias Bank.Commands.OpenAccount
  alias Bank.Events.AccountOpened

  defmodule Account do
    defstruct [:number, :balance]

    def execute(%Account{number: nil} = account, %OpenAccount{number: number, initial_balance: initial_balance})
        when initial_balance > 0
      do
        %AccountOpened{number: number, initial_balance: initial_balance}
      end

      def execute(%Account{}, %OpenAccount{initial_balance: initial_balance})
        when initial_balance <= 0
      do
        {:error, :initial_balance_must_be_above_zero}
      end

      def execute(%Account{}, %OpenAccount{}) do
        {:error, :account_already_opened}
      end

      def apply(%Account{} = account, %AccountOpened{number: number, initial_balance: initial_balance}) do
        %Account{account |
          number: number,
          balance: initial_balance
        }
      end

  end
end
