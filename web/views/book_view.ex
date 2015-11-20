defmodule Castle.BookView do
  use Castle.Web, :view

  def render("index.json", %{books: books}) do
    %{data: render_many(books, Castle.BookView, "book.json")}
  end

  def render("show.json", %{book: book}) do
    %{data: render_one(book, Castle.BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{id: book.id,
      isbn: book.isbn,
      title: book.title,
      genre: book.genre,
      author: book.author,
      word_count: book.word_count,
      pages: book.pages,
      status: book.status}
  end
end
