alias ElixirShoppingCart.Repo
alias ElixirShoppingCart.Cart.Item

%Item{
  name: "Pencil",
  description: "Pencil",
  term_price: 10
} |> Repo.insert!

%Item{
  name: "Pen",
  description: "Pen",
  term_price: 6
} |> Repo.insert!

%Item{
  name: "Eraser",
  description: "Eraser",
  term_price: 2
} |> Repo.insert!
