defmodule Bank.Events do

  defmodule AccountOpened do
    defstruct [:number, :initial_balance]
  end

end
