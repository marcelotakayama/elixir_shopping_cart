defmodule ElixirShoppingCart.Cart.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :name, :string
    field :description, :string
    field :term_price, :integer

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :description, :term_price])
    |> validate_required([:name, :description, :term_price])
  end
end
