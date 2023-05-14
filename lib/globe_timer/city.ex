defmodule GlobeTimer.City do
  use Ecto.Schema
  import Ecto.Changeset

  alias GlobeTimer.TimezoneUtils

  schema "cities" do
    field :name, :string
    field :timezone, :string

    timestamps()
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:name, :timezone])
    |> validate_required([:name, :timezone])
    |> validate_inclusion(:timezone, TimezoneUtils.timezone_abbreviations())
  end
end
