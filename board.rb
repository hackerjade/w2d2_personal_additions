class Board
  def initialize
    @grid = Array.new(8) {Array.new(8) } #needs to be completed
  end

  def on_board?
    puts 'On board'
  end

  def occupied?(pos)
    self[pos]
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(row, col, value)
    # row,col = pos
    @grid[row][col] = value
  end
end

#   + occupied?(pos)
#   + piece_at(pos)
#   + checkmate?
#   + check?
#   + `#deep_dup`
#
