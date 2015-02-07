class Board
  attr_reader :board
  attr_accessor :current_block

  def initialize(board = starting_board)
    @board = board
    @size = [board.size, board.first.size]
    add_block_at_coords(random_block_at_top)
  end

  def add_block_at_coords(coords)
    coords.each {|x,y| @board[x][y] = '@'}
    @current_block = coords
  end

  def block_fall
    lowest_parts = block_get_lowest_parts
    next_coords = @current_block.map {|x, y| x, y = x + 1, y}

    if lowest_parts.any? {|x, y| (not in_range? [x + 1, y]) or board[x + 1][y] == '@'}
      @current_block = nil
    else
      alter_cells(next_coords)
    end
  end

  def block_move_left
    if not @current_block.nil?
      most_left_parts = block_most_left_parts
      next_coords = @current_block.map {|x, y| x, y = x, y - 1}

      if most_left_parts.all? {|x, y| in_range? [x, y - 1] and board[x][y - 1] != '@'}
        alter_cells(next_coords)
      end
    end
  end

  def block_move_right
    if not @current_block.nil?
      most_right_parts = block_most_right_parts
      next_coords = @current_block.map {|x, y| x, y = x, y + 1}

      if most_right_parts.all? {|x, y| in_range? [x, y + 1] and board[x][y + 1] != '@'}
        alter_cells(next_coords)
      end
    end
  end

  private

  def alter_cells(coords)
    @current_block.each {|x, y| @board[x][y] = ' '}
    @current_block = coords
    @current_block.each {|x, y| @board[x][y] = '@'}
  end

  def in_range?(coord)
    coord[0] >= 0 and coord[0] < @size[0] and
    coord[1] >= 0 and coord[1] < @size[1]
  end

  def block_get_lowest_parts(coords = @current_block)
    coords.select {|x, y| not coords.any? {|coord| coord == [x + 1, y]}}
  end

  def block_most_left_parts(coords = @current_block)
    coords.select {|x, y| not coords.any? {|coord| coord == [x, y - 1]}}
  end

  def block_most_right_parts(coords = @current_block)
    coords.select {|x, y| not coords.any? {|coord| coord == [x, y + 1]}}
  end
end

def starting_board
  [[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
   [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],]
end

def random_block_at_top
  blocks_initial_coords[rand(7)]
end

def blocks_initial_coords
  {0 => [[0,3], [0,4], [0,5], [0,6]],
   1 => [[0,3], [0,4], [1,4], [1,5]],
   2 => [[0,4], [0,5], [1,3], [1,4]],
   3 => [[0,4], [0,5], [1,4], [1,5]],
   4 => [[0,4], [1,3], [1,4], [1,5]],
   5 => [[0,5], [1,3], [1,4], [1,5]],
   6 => [[0,3], [1,3], [1,4], [1,5]],}
end



