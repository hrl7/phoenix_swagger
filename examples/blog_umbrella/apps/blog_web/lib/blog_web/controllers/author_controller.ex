defmodule BlogWeb.AuthorController do
  use BlogWeb, :controller

  alias Blog.Posts
  alias Blog.Posts.Author

  action_fallback BlogWeb.FallbackController

  def index(conn, _params) do
    authors = Posts.list_authors()
    render(conn, "index.json", authors: authors)
  end

  def create(conn, %{"author" => author_params}) do
    with {:ok, %Author{} = author} <- Posts.create_author(author_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", author_path(conn, :show, author))
      |> render("show.json", author: author)
    end
  end

  def show(conn, %{"id" => id}) do
    author = Posts.get_author!(id)
    render(conn, "show.json", author: author)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = Posts.get_author!(id)

    with {:ok, %Author{} = author} <- Posts.update_author(author, author_params) do
      render(conn, "show.json", author: author)
    end
  end

  def delete(conn, %{"id" => id}) do
    author = Posts.get_author!(id)
    with {:ok, %Author{}} <- Posts.delete_author(author) do
      send_resp(conn, :no_content, "")
    end
  end
end
