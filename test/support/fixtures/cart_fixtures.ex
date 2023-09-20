defmodule ElixirShoppingCart.CartFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirShoppingCart.Cart` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        term_price: 42
      })
      |> ElixirShoppingCart.Cart.create_item()

    item
  end
end
