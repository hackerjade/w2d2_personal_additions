require_relative 'piece'
require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board

  def initialize
    @board = Board.new
  end
end
