defmodule WorldDominationLiveWeb.MapSquareLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div phx-click="toggle" phx-value="<%= @state %>" class="grid-square <%= @state %>">&nbsp;</div>
    """
  end

  def mount(_session, socket) do
    IO.inspect(socket)
    {:ok, assign(socket, state: "unselected")}
  end

  def handle_event("toggle", value, socket) do
    # IO.inspect(socket)
    # IO.puts("handling: #{value}")
    new_state = if value == "selected", do: "unselected", else: "selected"
    {:noreply, assign(socket, state: new_state)}
  end
end
