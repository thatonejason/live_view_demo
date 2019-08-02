defmodule LiveViewDemoWeb.GridSquareLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div phx-click="toggle" phx-value="<%= @state %>" class="grid-square <%= @state %>">&nbsp;</div>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, state: "unselected")}
  end

  def handle_event("toggle", value, socket) do
    IO.puts("handling: #{value}")
    new_state = if value == "selected", do: "unselected", else: "selected"
    {:noreply, assign(socket, state: new_state)}
  end
end
