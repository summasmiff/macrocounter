defmodule Macrocounter.EntryController do
  use Macrocounter.Web, :controller
  import Logger

  alias Macrocounter.{Entry, User}

  def index(conn, _params) do
    entries = Repo.all(Entry)
    render(conn, "index.json", entries: entries)
  end

  def create(conn, %{"entry" => params}) do
    user = Repo.get_by!(User, name: "Summer")
    changeset_params = Map.merge(params, %{"user_id" => user.id})
    changeset = Entry.changeset(%Entry{}, changeset_params)

    case Repo.insert(changeset) do
      {:ok, entry} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", entry_path(conn, :show, entry))
        |> render("show.json", entry: entry)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Macrocounter.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    entry = Repo.get!(Entry, id)
    render(conn, "show.json", entry: entry)
  end

  def update(conn, %{"id" => id, "entry" => entry_params}) do
    entry = Repo.get!(Entry, id)
    changeset = Entry.changeset(entry, entry_params)

    case Repo.update(changeset) do
      {:ok, entry} ->
        render(conn, "show.json", entry: entry)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Macrocounter.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    entry = Repo.get!(Entry, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(entry)

    send_resp(conn, :no_content, "")
  end
end
