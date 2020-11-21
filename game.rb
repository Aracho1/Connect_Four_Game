require 'board'
require 'player'


class Game

  def initialize
    # 5 x 4 game board
    @p1 = Player.new("\u26AA".encode("utf-8"))
    @p2 = Player.new("\u26D4".encode("utf-8"))
    @board = Board.new
    run_game
  end

  def open_game
    puts "Let's play Connect Four!"
    puts "There are two players: #{@p1} and #{@p2}"
    puts "The game has to be played bottom up.\nIf the board's lower spot isn't filled,you cannot place a move."
    puts "The player who connects 4 moves first wins!"
    @board.print_board
  end
  # get input from the user
  def get_input
    puts "Enter your move: "
    @board.valid_move?(gets.chomp) || try_again
  end

  # Prompt the user to try again if invalid input
  def try_again
    puts "Invalid input. Try again"
    get_input
  end


  # announce the winner
  def announce_winner(player)
    puts "Player #{player} wins!"
    puts "Exiting the game..."
    sleep 1
    exit
  end

  # putting them together...
  def run_game
    open_game
    player = @p1
    loop do
      @board.spot = nil
      @board.available_spots?
      player = swap_player(player)
      get_input
      @board.update(player)
      announce_winner(player) if @board.any_winner?
    end
  end
end

game = Game.new
