defmodule GlobeTimerWeb.TimezonesLive do
  use GlobeTimerWeb, :live_view

  alias GlobeTimer.ApiQueries
  alias GlobeTimer.TimezoneUtils

  def mount(_params, _session, socket) do
    cities = ApiQueries.list_cities()
    socket =
      socket
      |> assign(:timezones, TimezoneUtils.timezone_abbreviations())
      |> assign(:cities, cities)

    {:ok, socket}
  end
  def render(assigns) do
    ~H"""
    <div class="container mx-auto grid grid-cols-2 p-4 bg-white border rounded-lg shadow-md">
      <div>
        <h2 class="text-center my-4">Enter Time</h2>
        <input type="text" name="time" placeholder="HH:MM UTC" class="py-2 px-4 border rounded-lg shadow-md" />
      </div>
      <div>
        <h2 class="text-center my-4">Add Timezone</h2>
        <label for="city-name">City name:</label>
        <input type="text" name="city-name" class="py-2 px-4 border rounded-lg shadow-md" />
        <button class="my-4 py-2 px-4 bg-blue-500 text-white rounded-lg shadow-md">Add</button>
      </div>
      <div class="col-span-2">
        <h2 class="text-center my-4">Your Timezones</h2>
        <table class="grid grid-cols-4 gap-4 border rounded-lg shadow-md">
          <thead class="py-2 bg-gray-100">
            <tr>
              <th class="text-left px-4">City</th>
              <th class="text-left px-4">Time</th>
              <th class="text-left px-4">TZ (Timezone)</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <%= for city <- @cities do %>
              <tr class="bg-gray-50 hover:bg-gray-100 border-t border-b border-gray-200">
                <td class="py-2 px-4 text-sm text-gray-700"><%= city.name %></td>
                <td class="py-2 px-4 text-sm text-gray-700"><%= city.timezone |> Timex.now() |> Timex.format!("%H:%m", :strftime) %></td>
                <td class="py-2 px-4 text-sm text-gray-700"><%= city.timezone %></td>
                <td class="py-2 px-4 text-sm text-gray-700 text-right"><button class="py-2 px-4 bg-red-500 text-white rounded-lg shadow-md">Delete</button></td>
              </tr>
            <% end %>
          </tbody>
        </table>
      </div>
    </div>
    """
  end
end
