defmodule Bank.AccountController do
  use BankWeb, :controller
  alias Bank.Router
  alias Bank.Commands.OpenAccount

  def create(conn, %{"account" => {"number" => number, "initial_balance" => initial_balance}}) do
    case Router.dispatch(%OpenAccount{account_number: number, initial_balance: initial_balance}) do
      {:ok} => json %{}, status: 202
      {:error, error } => json json %{"errors" => [error]}, status: 422
    end
  end
end
