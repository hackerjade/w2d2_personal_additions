class Board
  PIECES = [Rook, Knight,Bishop,King,Queen,Bishop,Knight,Rook]


  def initialize
    @grid = Array.new(8) {Array.new(8) }
    set_piece_positions
  end

  def on_board?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
  end

  def in_check?(color)
    other_pieces = []
    king_piece = nil
    @grid.each do |row|
      row.each do |piece|
        next if piece.nil?
        king_piece = piece if piece.class == King && piece.color == color
        other_pieces << piece if piece.color != color
      end
    end

    other_pieces.each do |other_piece|
      return true if other_piece.moves.include?(king_piece.pos)
    end

    return false
  end

  def set_piece_positions
    (0..7).each do |row|
      next if row.between?(2,5)
      (0..7).each do |col|
        if row == 0
          self[row,col] = PIECES[col].new(self,[row,col],:white,false)
        elsif row == 7
          self[row,col] = PIECES.reverse[col].new(self,[row,col],:black,false)
        # elsif row == 1
        #   self[row,col] = Pawn.new(self,[row,col],:white,false)
        # else
        #   self[row,col] = Pawn.new(self,[row,col],:black,false)
        end
      end
    end
  end

  def occupied?(pos)
    self[pos]
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(row,col,value)
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
