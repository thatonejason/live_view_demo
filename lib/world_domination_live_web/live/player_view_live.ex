defmodule WorldDominationLiveWeb.PlayerViewLive do
  use Phoenix.LiveView
  alias WorldDominationLive.PlayerState

  def render(assigns) do
    ~L"""
    <div class="parent">
      <div class="map-wrapper">
        <%= for i <- (1..100) do %>
          <div phx-click="toggle" phx-value="<%= i %>" class="grid-square <%= css_class(assigns, @id || i) %>">&nbsp;</div>
        <% end %>
      </div>
      <div class="palette-wrapper">
      <div class = "grid-square ground1">Ground 1</div>
    <div class = "grid-square ground2">Ground 2</div>
    <div class = "grid-square ice1">ice 1</div>
    <div class = "grid-square ice2">Ice 2</div>
    <div class = "grid-square trees1">Trees 1</div>
    <div class = "grid-square trees2">Trees 2</div>
    <div class = "grid-square vert-road-background">Vert Road Background</div>
    <div class = "grid-square horizontal-road-background">Horiz Road Background</div>
    <div class = "grid-square crossroad-background">Crossroad Background</div>
    <div class = "grid-square down-t-road-background">Down T w/Background</div>
    <div class = "grid-square up-t-road-background">Up T w/background</div>
    <div class = "grid-square trees4">Trees 4</div>
    <div class = "grid-square right-down-road-curve-background">Right down road Background</div>
    <div class = "grid-square left-down-road-curve-background">Left down w/background</div>
    <div class = "grid-square right-culdesac-background">right culdesac w/background</div>
    <div class = "grid-square left-t-road-background">Left T w/background</div>
    <div class = "grid-square right-t-road-background">right T w/background</div>
    <div class = "grid-square trees5">Trees 5</div>
    <div class = "grid-square trees6">Trees 6</div>
    <div class = "grid-square trees7">Trees 7</div>
    <div class = "grid-square trees8">Trees 8</div>
    <div class = "grid-square top-right-road-curve-background">Top right w/background</div>
    <div class = "grid-square top-left-road-curve-background">Top left w/backgroudn</div>
    <div class = "grid-square left-culdesac-background">Left culdesac w/backgroudn</div>
    <div class = "grid-square bottom-culdesac-background">Bottom culdesac w/backgroudn</div>
    <div class = "grid-square top-culdesac-background">Top culdesac w/backgroudn</div>
    <div class = "grid-square">&nbsp;</div>
    <div class = "grid-square">&nbsp;</div>
    <div class = "grid-square">&nbsp;</div>
    <div class = "grid-square">&nbsp;</div>
    <div class = "grid-square">&nbsp;</div>
    <div class = "grid-square">&nbsp;</div>
    <div class = "grid-square">&nbsp;</div>
    <div class = "grid-square">&nbsp;</div>
    <div class = "grid-square">&nbsp;</div>
    <div class = "grid-square">&nbsp;</div>
    <div class = "grid-square">&nbsp;</div>
    <div class = "grid-square">&nbsp;</div>
    <div class = "grid-square">&nbsp;</div>
    <div class = "grid-square">&nbsp;</div>
      </div>
    </div>
    """
  end

  def css_class(%{player_state: player_state}, id) do
    {:ok, player} = player_state
    # IO.inspect(player)
    PlayerState.get(player, id) || "unselected"
    # Map.get(player_state, id)
  end

  def mount(_session, socket) do
    IO.puts("mounted")
    player_state = PlayerState.start_link([])
    # IO.inspect(socket)
    {:ok, assign(socket, id: nil, player_state: player_state)}
  end

  def handle_event("toggle", value, socket) do
    current_css = css_class(socket.assigns, value)
    IO.inspect(socket.assigns)
    IO.puts(current_css)
    IO.puts(value)
    {:ok, player} = socket.assigns.player_state
    IO.inspect(player)

    new_state =
      case current_css do
        "selected" -> "unselected"
        "unselected" -> "selected"
        _ -> "selected"
      end

    PlayerState.put(player, value, new_state)
    # new_state = "selected"

    # new_state = if current_css == ('' || "selected"), do: "unselected", else: "selected"
    {:noreply, assign(socket, id: value)}
  end
end
