defmodule ElixirShoppingCart.CartTest do
  use ElixirShoppingCart.DataCase

  alias ElixirShoppingCart.Cart

  describe "items" do
    alias ElixirShoppingCart.Cart.Item

    import ElixirShoppingCart.CartFixtures

    @invalid_attrs %{name: nil, description: nil, term_price: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Cart.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Cart.get_item!(item.id) == item
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

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", term_price: 43}

      assert {:ok, %Item{} = item} = Cart.update_item(item, update_attrs)
      assert item.name == "some updated name"
      assert item.description == "some updated description"
      assert item.term_price == 43
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Cart.update_item(item, @invalid_attrs)
      assert item == Cart.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Cart.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Cart.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Cart.change_item(item)
    end
  end
end
