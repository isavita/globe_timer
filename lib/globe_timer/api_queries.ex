defmodule GlobeTimer.ApiQueries do
  @moduledoc """
  A module for API queries.
  """
  alias GlobeTimer.City
  alias GlobeTimer.Repo

  def list_cities do
    Repo.all(City)
  end

  def create_city(attrs) do
    %City{}
    |> City.changeset(attrs)
    |> Repo.insert()
  end

  def delete_city(id) do
    City.get!(id)
    |> Repo.delete!()
  end
end
