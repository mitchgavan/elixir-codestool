defmodule SocketGallows.Web.HangmanChannel do

    require Logger

    use Phoenix.Channel

    def join("hangman:game", _, socket) do
        game = Hangman.new_game()
        socket = assign(socket, :game, game)
        { :ok, socket }
    end 

    def handle_in("tally", _, socket) do
        game = socket.assigns.game
        tally = Hangman.tally(game)
        push(socket, "tally", tally)
        { :noreply, socket }
    end

    def handle_in("make_move", guess, socket) do
        tally = socket.assigns.game |> Hangman.make_move(guess)
        push(socket, "tally", tally)
        { :noreply, socket }
    end

    def handle_in("new_game", _, socket) do
        socket = socket |> assign(:game, Hangman.new_game())
        handle_in("tally", nil, socket)
    end

    def handle_in(message, _, socket) do
        Logger.error("whoops, we don't serve this message")
    end
   
end