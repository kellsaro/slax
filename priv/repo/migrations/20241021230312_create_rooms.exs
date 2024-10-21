defmodule Slax.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:roomsi, primary_key: [name: :uuid, type: :string]) do
      add :name, :string, null: false
      add :topic, :text

      timestamps(type: :utc_datetime)
    end
  end
end
