defmodule GlobeTimer.Repo do
  use Ecto.Repo,
    otp_app: :globe_timer,
    adapter: Ecto.Adapters.Postgres
end
