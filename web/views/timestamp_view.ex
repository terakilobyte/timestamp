defmodule Timestamp.TimestampView do
  use Timestamp.Web, :view

  def render("index.json", %{timestamp: timestamp}) do
    %{unix: timestamp.unix, natural: timestamp.natural}
  end
end
