defmodule Blog.Posts.Author do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Posts.{Post, Author}


  schema "authors" do
    field :name, :string
    field :password_hash, :string
    has_many :posts, Post

    timestamps()
  end

  @doc false
  def changeset(%Author{} = author, attrs) do
    author
    |> cast(attrs, [:name, :password_hash])
    |> validate_required([:name, :password_hash])
  end
end
