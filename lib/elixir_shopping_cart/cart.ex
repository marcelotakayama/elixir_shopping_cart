defmodule ElixirShoppingCart.Cart do
  @moduledoc """
  The Cart context.
  """

  import Ecto.Query, warn: false
  alias ElixirShoppingCart.Repo

  alias ElixirShoppingCart.Cart.Item

  @doc """
  Returns the list of items.

  ## Examples

      iex> list_items()
      [%Item{}, ...]

  """
  def list_items() do
    Repo.all(Item)
  end

  @doc """
  Returns an item by the id.

  ## Examples

      iex> get_item(id)
      [%Item{}, ...]

  """
  def get_item(id) do
    case Repo.get(Item, id) do
      nil ->
        {:error, "Item not found"}

      item ->
        {:ok, item}
    end
  end

  @doc """
  Creates an item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(params) do
    Item.changeset(%Item{}, params)
    |> Repo.insert()
  end

  @doc """
  Deletes a item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """

  def delete_item(id) do
    case get_item(id) do
      {:ok, item} ->
        Repo.delete(item)
        {:ok, item}

      {:error, _reason} ->
        {:error, "Item not found"}
    end
  end
end
