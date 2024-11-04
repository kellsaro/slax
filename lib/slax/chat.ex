defmodule Slax.Chat do
  alias Slax.Chat.Room
  alias Slax.Repo

  import Ecto.Query

  def get_first_room!() do
    Repo.one!(from r in Room, limit: 1, order_by: [asc: :name])
  end

  def get_room!(id) do
    Repo.get!(Room, id) # TODO: Investigate why Enum.find(rooms, &(&1.id == id)) doesn't work
  end

  def list_rooms do
    Repo.all(from r in Room, order_by: [asc: :name])
  end
end
