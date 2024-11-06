defmodule Slax.Chat do
  alias Slax.Chat.{Message, Room}
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

  def create_room(attrs) do
    %Room{}
    |> Room.changeset(attrs)
    |> Repo.insert()
  end

  def update_room(%Room{} = room, attrs) do
    room
    |> Room.changeset(attrs)
    |> Repo.update()
  end

  def change_room(room, attrs \\ %{}) do
    Room.changeset(room, attrs)
  end

  def list_messages_in_room(%Room{id: room_id}) do
    from(m in Message,
      where: m.room_id == ^room_id,
      order_by: [asc: :inserted_at, asc: :id]
    )
    |> Repo.all()
  end
end
