class Board
  PIECES = [ Rook,
            Knight,
            Bishop,
            King,
            Queen,
            Bishop,
            Knight,
            Rook
            ]

  def initialize
    @board = Array.new(8) { Array.new(8) }

    set_piece_positions
  end

  def on_board?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
  end

  def in_check?(color)
    other_pieces = []
    king_piece = nil
    @board.each do |row|
      row.each do |piece|
        next if piece.nil?
        king_piece = piece if piece.class == King && piece.color == color
        other_pieces << piece if piece.color != color
      end
    end

    other_pieces.each do |other_piece|
      next if other_piece.moves.empty?
      return true if other_piece.moves.include?(king_piece.pos)
    end

    return false
  end

  def move(start_pos, end_pos)
    raise "Invalid move." if self[start_pos] == nil || !self[start_pos].moves.include?(end_pos)
    start_row, start_col = start_pos
    end_row, end_col = end_pos
    self[start_row,start_col],self[end_row,end_col] = nil, self[start_pos]

    self
  end

  def set_piece_positions
    (0..7).each do |row|
      next if row.between?(2,5)
      (0..7).each do |col|
        if row == 0
          self[row,col] = PIECES[col].new(self,[row,col],:white,false)
        elsif row == 7
          self[row,col] = PIECES.reverse[col].new(self,[row,col],:black,false)
        elsif row == 1
        #   self[row,col] = Pawn.new(self,[row,col],:white,false)
        # else
        #   self[row,col] = Pawn.new(self,[row,col],:black,false)
        end
      end
    end
  end

  def render
    # new_grid = []
    # (0..7).each do |row|
    #   next_row = []
    #   (0..7).each do |col|
    #     # if row % 2 == 0 && col % 2 == 0
    #     #   .colorize(:background => :red)
    #     # else
    #     #   .colorize(:background => :cyan)
    #     # end
    #     if @board[row][col] == nil
    #       next_row << "_"
    #     else
    #       tester = @board[row][col].display
    #       puts tester.colorize(:background => :green)
    #       # next_row << @board[row][col].display.colorize(:background => :green)
    #     end
    #   end
    #   new_grid << next_row
    # end
    #  p new_grid

    new_array = (0..7).map do |row|
      (0..7).map do |col|
        if @board[row][col] == nil
          "  ".colorize(:background => checker_background(row, col))
        else
          tester = @board[row][col].display
          tester.colorize(:background => checker_background(row, col))
          # next_row << @board[row][col].display.colorize(:background => :green)
        end
      end.join("")
    end.join("\n")

    new_array
  end

  def checker_background(row, col)
    if row % 2 == 0 && col % 2 == 0 || row % 2 != 0 && col % 2 != 0
      :light_red
    else
      :cyan
    end
  end

  def dup
    new_board = Board.new

    (0..7).each do |row|
      (0..7).each do |col|
        next if @board[row][col] == nil
        new_board[row, col] = @board[row][col].dup
      end
    end

    new_board
  end

  def occupied?(pos)
    self[pos]
  end

  def [](pos)
    row,col = pos
    @board[row][col]
  end

  def []=(row,col,value)
    # row,col = pos
    @board[row][col] = value
  end
end

#   + occupied?(pos)
#   + piece_at(pos)
#   + checkmate?
#   + check?
#   + `#deep_dup`
#
