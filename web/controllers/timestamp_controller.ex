defmodule Timestamp.TimestampController do
  use Timestamp.Web, :controller

  use Timex

  @months %{"January" => 1, "February" => 2, "March" => 3, "April" => 4, "May" => 5, "June" => 6,
            "July" => 7, "August" => 8, "September" => 9, "October" => 10, "November" => 11, "December" => 12}

  def index(conn, params) do
    date =
      params["timestamp"]
      |> String.split(" ")
      |> IO.inspect
      |> parse_date

    render(conn, "index.json", [timestamp: %{natural: "test", unix: "test"}] )
  end

  defp parse_date()
end
