defmodule ElixirShoppingCartWeb.Schema.Schema do
  alias ElixirShoppingCartWeb.Resolvers.Cart
  use Absinthe.Schema

  query do
    @desc "Get a list of all items"
    field :list_items, list_of(:item) do
      resolve(&Cart.list_items/3)
    end

    @desc "Get an item by its id"
    field :item, :item do
      arg(:id, non_null(:id))
      resolve(&Cart.get_item/3)
    end
  end

  mutation do
    field :create_item, type: :item do
      arg(:name, non_null(:string))
      arg(:description, non_null(:string))
      arg(:term_price, non_null(:float))
      resolve(&Cart.create_item/2)
    end

    field :delete_item, type: :item do
      arg(:id, non_null(:id))
      resolve(&Cart.delete_item/2)
    end
  end

  object :item do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :description, non_null(:string)
    field :term_price, non_null(:float)
  end
end
