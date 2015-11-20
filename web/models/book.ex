defmodule Castle.Book do
  use Castle.Web, :model

  schema "books" do
    field :isbn, :string
    field :title, :string
    field :genre, :string
    field :author, :string
    field :word_count, :integer
    field :pages, :integer
    field :status, :string

    timestamps
  end

  @required_fields ~w(isbn title genre author word_count pages status)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
