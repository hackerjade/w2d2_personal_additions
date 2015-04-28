# Chess

class Piece
  attr_reader :color, :pos

  def initialize(board, pos, color, moved = false)
    @board, @pos, @color, @moved = board, pos, color, moved
  end

  def symbol
    raise NotImplementedError.new
  end

  def moves

  end

  def inspect
    { :piece => self.class, :piece_color => self.color}.inspect
  end

  def is_blocked?(pos)
    @board.occupied?(pos) && self.color == @board[pos].color
  end

end


class Pawn < Piece
end

class SlidingPiece < Piece

  def moves
    valid_moves = []

    move_dirs.each do |direction|
      dx,dy = direction
      new_position = [@pos[0] + dx, @pos[1] + dy]

      until is_blocked?(new_position) || !@board.on_board?(new_position)
        if is_opponent_piece?(new_position)
          valid_moves << new_position
          break
        end
        valid_moves << new_position
        new_position = [new_position[0] + dx, new_position[1] + dy]
      end
    end

    valid_moves
  end

  def is_opponent_piece?(pos)
    @board.occupied?(pos) && self.color != @board[pos].color
  end

end

class Rook < SlidingPiece

  def move_dirs
    [
    [0, 1],
    [1, 0],
    [-1, 0],
    [0, -1]
    ]
  end

end

class Bishop < SlidingPiece

  def move_dirs
    [
    [1, 1],
    [-1, -1],
    [1, -1],
    [-1, 1]
    ]
  end
end

class Queen < SlidingPiece
  def move_dirs
    [
    [-1, -1],
    [-1,  0],
    [-1,  1],
    [ 0, -1],
    [ 0,  1],
    [ 1, -1],
    [ 1,  0],
    [ 1,  1]
    ]
  end
end


class SteppingPiece < Piece
  def moves
    valid_moves = []

    move_dirs.each do |direction|
      dx,dy = direction
      new_position = [@pos[0] + dx, @pos[1] + dy]
      next if is_blocked?(new_position) || !@board.on_board?(new_position)
      valid_moves << new_position
    end

    valid_moves
  end
end

class Knight < SteppingPiece
  def move_dirs
    [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
    ]
  end
end

class King < SteppingPiece
  def move_dirs
    [
    [-1, -1],
    [-1,  0],
    [-1,  1],
    [ 0, -1],
    [ 0,  1],
    [ 1, -1],
    [ 1,  0],
    [ 1,  1]
    ]
  end
end

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
