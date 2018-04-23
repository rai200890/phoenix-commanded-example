defmodule Bank.Router do
  use Commanded.Commands.Router
  alias Bank.Commands.OpenAccount
  alias Bank.Aggregates.Account

  dispatch OpenAccount, to: Account, identity: :number
end
