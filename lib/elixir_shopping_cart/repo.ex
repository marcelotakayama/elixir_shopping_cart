defmodule ElixirShoppingCart.Repo do
  use Ecto.Repo,
    otp_app: :elixir_shopping_cart,
    adapter: Ecto.Adapters.Postgres
end
