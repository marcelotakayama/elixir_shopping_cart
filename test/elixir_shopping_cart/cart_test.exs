defmodule ElixirShoppingCart.CartTest do
  use ElixirShoppingCart.DataCase

  alias ElixirShoppingCart.Cart

  describe "items" do
    alias ElixirShoppingCart.Cart.Item

    import ElixirShoppingCart.CartFixtures

    @invalid_attrs %{name: nil, description: nil, term_price: nil}

    test "list_items/0 returns all items" do
      item = Repo.all(Item)
      assert Cart.list_items() == item
    end

    test "list_items/0 returns an empty list when there are no items" do
      Repo.delete_all(Item)
      assert Cart.list_items() == []
    end

    test "get_item/1 returns an existing item" do
      item = item_fixture()
      assert {:ok, fetched_item} = Cart.get_item(item.id)
      assert fetched_item == item
    end

    test "get_item/1 returns an error for non-existent item" do
      non_existent_id = -1
      assert {:error, "Item not found"} = Cart.get_item(non_existent_id)
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{name: "some name", description: "some description", term_price: 42}

      assert {:ok, %Item{} = item} = Cart.create_item(valid_attrs)
      assert item.name == "some name"
      assert item.description == "some description"
      assert item.term_price == 42
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cart.create_item(@invalid_attrs)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()

      case Repo.get(Item, item.id) do
        nil ->
          assert {:error, "Item not found"} = Cart.delete_item(item.id)

        _ ->
          assert {:ok, _deleted_item} = Cart.delete_item(item.id)
      end
    end

    test "delete_item/1 returns an error for non-existent item" do
      non_existent_id = -1

      case Cart.delete_item(non_existent_id) do
        {:error, "Item not found"} -> assert true
        _ -> assert false, "Expected error when deleting non-existent item"
      end
    end
  end
end
