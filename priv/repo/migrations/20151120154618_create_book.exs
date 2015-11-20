defmodule Castle.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :isbn, :string
      add :title, :string
      add :genre, :string
      add :author, :string
      add :word_count, :integer
      add :pages, :integer
      add :status, :string

      timestamps
    end

  end
end
