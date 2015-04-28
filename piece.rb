# Chess

class Piece
  def initialize(board, pos, color, moved)
    @board, @pos, @color, @moved = board, pos, color, moved
  end

  def symbol
    raise NotImplementedError.new
  end

  def moves
    raise "Not yet implemented"

  end

end


class Pawn < Piece
  def initialize

  end
end

class SlidingPiece < Piece
  def initialize

  end

  def moves
    move_dirs
  end

  
end

class Rook < SlidingPiece
  def initialize

  end

  def move_dirs
    puts "Rook Moving"
  end

end

class Bishop < SlidingPiece
  def initialize

  end

  def move_dirs
    puts "Bishop moving"
  end
end

class Queen < SlidingPiece
  def initialize

  end
end


class SteppingPiece < Piece
  def initialize

  end
end



# end
# + Piece
#     + @color
#     + @pos
#     + @moved
#     + @board
#     + #valid_moves()
#  + Pawn (weird)
#  + SlidingPiece
#    + #moves()
#    + Rook
#      + #move_dirs()
#      + #symbol "R"
#    + Bishop
#    + Queen
#  + SteppingPiece
#    + #move_diffs()
#    + King
#    + Knight
#
# + Player
# + Game
#
# ---
#
# ## `Piece`
# + pos
# + board
# + color
# + moves()
#
# ## `SlidingPiece`
# + move_dirs()
# ## `SteppingPiece`
# + move_diffs()
#
# ---
#
# ## Approach
#
# 1. Board
# 2. Piece moving
# 3. Pawn (simple Game class)
# 4. in_check?(color)
# 5. update piece to have valid_moves = moves - moves_into_check (HINT:
# dup board)
# 6. check_mate?(color)
