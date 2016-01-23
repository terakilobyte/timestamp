defmodule Timestamp.TimestampController do
  use Timestamp.Web, :controller

  use Timex

  def index(conn, params) do
    date =
      params["timestamp"]
      |> parse_date

    render(conn, "index.json", timestamp: date)
  end

  defp parse_date(date) do
    case Integer.parse(date) do
      :error ->
        parse_natural_date(date)
      _ ->
        parse_unix(date)
    end
  end

  defp parse_unix(date) do
    {:ok, unix} =
      DateFormat.parse(date, "%s", :strftime)
    {:ok, natural} =
      DateFormat.format(unix, "%B %d, %Y", :strftime)
    %{unix: date, natural: natural }
  end

  defp parse_natural_date(date) do
    {:ok, natural} =
      String.replace(date, ",", "")
      |> String.split(" ")
      |> Enum.join("-")
      |> IO.inspect
      |> DateFormat.parse("%B-%d-%Y", :strftime)
    {:ok, unix} =
      DateFormat.format(natural, "%s", :strftime)
    {:ok, natural_date} = DateFormat.format(natural, "%B %d, %Y", :strftime)
    %{unix: unix, natural: natural_date}
  end
end
