defmodule Blog.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :password_hash, :string

      timestamps()
    end

  end
end
