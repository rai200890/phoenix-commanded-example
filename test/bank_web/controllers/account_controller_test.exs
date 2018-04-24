defmodule BankWeb.AccountControllerTest do
  use BankWeb.ConnCase, async: true

  @create_attrs %{initial_balance: 42, number: "1"}
  @invalid_attrs %{initial_balance: nil}

  describe "create" do
    setup %{conn: conn} do
      {:ok, conn: put_req_header(conn, "accept", "application/json")}
    end

    test "creates account when data is valid", %{conn: conn} do
      conn = post(conn, account_path(conn, :create), account: @create_attrs)

      assert json_response(conn, 201)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, account_path(conn, :create), account: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
