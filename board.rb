class Board
  def initialize
    @board = [0, "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11",
              "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    @spot = nil
  end

  def print_board
      puts "-----|-----|-----|-----|-----|"
      puts "  #{@board[1]}  |  #{@board[2]}  |  #{@board[3]}  |  #{@board[4]}  |  #{@board[5]}  |"
      puts "-----|-----|-----|-----|-----|"
      puts " #{@board[6]}   |  #{@board[7]}  |  #{@board[8]}  |  #{@board[9]}  |  #{@board[10]} |"
      puts "-----|-----|-----|-----|-----|"
      puts " #{@board[11]}  |  #{@board[12]} |  #{@board[13]} |  #{@board[14]} |  #{@board[15]} |"
      puts "-----|-----|-----|-----|-----|"
      puts " #{@board[16]}  |  #{@board[17]} |  #{@board[18]} |  #{@board[19]} |  #{@board[20]} |"
      puts "_____|_____|_____|_____|_____|"
  end

  def valid_move?(input)
    # check if the spot is within bounds
    if @board.detect{ |valid_spot| valid_spot == input}
      # accept immediately if it's a bottom spot
      input = input.to_i
      if 16 <= input and input <= 19
        @spot = input
        return true
      # accept if the lower spot isn't taken
      elsif @board[input + 5] != (input + 5).to_s
        @spot = input
        return true
      end
    end
    return false
  end

  def update(player)
    @board[@spot.to_i] = player
    print_board
  end

  # check if there are any free spots left in the board
  def available_spots?
    spots = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11",
              "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    if (@board & spots).any? == false
      puts "No spots left! It's a draw!"
      exit
    end
  end

  def connect_four?(array,n,i)
    return true if array[n] == array[n+i] && array[n+i] == array[n+i+i] && array[n+i+i]  == array[n+i+i+i]
  end

  def check_array(array, i)
    array.any?{ |start_position| connect_four?(@board, start_position, i)}
  end

  def any_winner?
    combo = { rows: [1,2,6,7,11,12,16,17],
              columns: [1,2,3,4,5],
              right_cross: [4, 5],
              left_cross: [1, 2]}

    return true if check_array(combo[:rows], 1)
    return true if check_array(combo[:columns], 5)
    return true if check_array(combo[:right_cross], 4)
    return true if check_array(combo[:left_cross], 6)
  end
end
