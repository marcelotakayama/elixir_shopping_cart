defmodule ElixirShoppingCartWeb.Resolvers.Cart do
  alias ElixirShoppingCart.Cart

  def list_items(_root, _args, _info) do
    {:ok, Cart.list_items()}
  end

  def get_item(_, %{id: id}, _) do
    case Cart.get_item(id) do
      {:ok, item} ->
        {:ok, item}

      {:error, reason} ->
        {:error, reason}
    end
  end

  def create_item(item_params, _) do
    with {:ok, item} <- Cart.create_item(item_params) do
      {:ok, item}
    else
      {:error, _} -> {:error, "Failed to create item"}
    end
  end

  def delete_item(%{id: id}, _info) do
    with {:ok, item} <- Cart.delete_item(id) do
      {:ok, item}
    else
      {:error, _} -> {:error, "Failed to delete item"}
    end
  end
end
