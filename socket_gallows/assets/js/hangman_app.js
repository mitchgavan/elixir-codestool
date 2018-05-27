import HangmanSocket from './hangman_socket.js'

window.onload = function () {
    const hangman = new HangmanSocket()

    hangman.connect_to_hangman()
}