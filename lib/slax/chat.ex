defmodule Slax.Chat do
  alias Slax.Chat.Room
  alias Slax.Repo

  def get_first_room!(rooms) do
    [room | _] = rooms
    room
  end

  def get_room!(id) do
    Repo.get!(Room, id) # TODO: Investigate why Enum.find(rooms, &(&1.id == id)) doesn't work
  end

  def list_rooms do
    Room |> Repo.all()
  end
end
