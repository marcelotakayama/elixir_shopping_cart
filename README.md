# ElixirShoppingCart

A simple CRUD of a shopping cart where you can:
* Create an Item
* Delete an Item
* List all Items in the cart

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Test the GraphQL

* After running the application, visit [`localhost:4000/graphiql`](http://localhost:4000/graphiql) to access the interface of GraphQL
* You can run the queries and mutations in the console

### List all Items in the cart

```
query {
  listItems {
    id
    name
    description
    termPrice
  }
}
```

### Create an Item

```
mutation{
  createItem(name:"paper7", description: "paper7", termPrice: 30.00){
    name
    id
    description
    termPrice
  }
}
```

### Delete an Item

```
mutation{
  deleteItem(id:"1"){
    id,
    name,
    description,
    termPrice
  }
}
```

## Test the Application

To run the tests of the Application, run `mix test`
