defmodule Slax.Repo.Migrations.CreateUniqueIndexOnRoomName do
  use Ecto.Migration

  def change do
    create index(:rooms, :name, unique: true)
  end
end
