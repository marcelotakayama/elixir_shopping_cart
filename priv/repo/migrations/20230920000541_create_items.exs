defmodule ElixirShoppingCart.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :description, :string
      add :term_price, :float

      timestamps()
    end
  end
end
