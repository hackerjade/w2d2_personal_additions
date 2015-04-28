require_relative 'piece'
require_relative 'board'
require_relative 'player'
require 'byebug'

class Game
  attr_reader :board, :player1, :player2

  def initialize(player1 = HumanPlayer.new, player2 = HumanPlayer.new)
    @player1 = player1
    @player2 = player2
    @board = Board.new
    @player1.color = :black
    @player2.color = :white
  end
end

if __FILE__ != $PROGRAM_NAME
  # game = Game.new
end
