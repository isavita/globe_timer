defmodule GlobeTimer.CityTest do
  use ExUnit.Case, async: true
  alias GlobeTimer.City

  describe "changeset/2" do
    test "valid city" do
      attrs = %{name: "New York", timezone: "EST"}
      city = %City{}

      changeset = City.changeset(city, attrs)

      assert changeset.valid?
    end

    test "invalid city" do
      attrs = %{name: "New York", timezone: "invalid/timezone"}
      city = %City{}

      changeset = City.changeset(city, attrs)

      refute changeset.valid?
      assert [{:timezone, {"is invalid", [_ | _]}}] = changeset.errors
    end
  end
end
