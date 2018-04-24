defmodule Bank.Events do
  @moduledoc false

  defmodule AccountOpened do
    @moduledoc false
    defstruct [:number, :initial_balance]
  end

end
