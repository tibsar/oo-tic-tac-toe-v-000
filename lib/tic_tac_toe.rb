
class TicTacToe
  WIN_COMBINATIONS =[ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    # 3.times do |n| 0 => 0   1 => 3  2 => 6
    #   puts " #{@board[n]} | #{@board[n+1]} | #{@board[n+2]} "
    #   if n < 2
    #     puts "------------"
    #   end
    # end
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(position, player)
    @board[position] = player
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end

  def valid_move?(position)
    position.between?(0, 8) && !position_taken?(position)
  end

  def turn_count
    @board.count{ |item| item == "X" || item == "O" }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    input = gets.strip
    index = input_to_index(input)

    while !valid_move?(index)
      input = gets.strip
      index = input_to_index(input)
    end

    move(index, current_player)
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
       if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
         return combo
       end
    end
    false
  end

  def full?
    @board.all?{ |item| item == "X" || item == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    combo = won?
    combo ? @board[combo[0]] : nil
  end

  def play
    until over?
      turn
    end

    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
