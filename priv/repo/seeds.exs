alias ElixirShoppingCart.Repo
alias ElixirShoppingCart.Cart.Item

%Item{
  name: "Pencil",
  description: "Pencil",
  term_price: 10.00
}
|> Repo.insert!()

%Item{
  name: "Pen",
  description: "Pen",
  term_price: 6.00
}
|> Repo.insert!()

%Item{
  name: "Eraser",
  description: "Eraser",
  term_price: 10.00
}
|> Repo.insert!()

%Item{
  name: "Eraser1",
  description: "Eraser1",
  term_price: 10.00
}
|> Repo.insert!()

%Item{
  name: "Eraser2",
  description: "Eraser2",
  term_price: 20.00
}
|> Repo.insert!()

%Item{
  name: "Eraser3",
  description: "Eraser3",
  term_price: 30.00
}
|> Repo.insert!()
