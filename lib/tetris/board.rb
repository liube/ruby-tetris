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
    @current_block.each {|x,y| @board[x][y] = ' '}
    @current_block = @current_block.map {|x,y| x, y = x + 1, y}
    @current_block.each {|x,y| @board[x][y] = '@'}
  end

  def block_move_left
    next_coord = @current_block.map {|x,y| x, y = x, y - 1}

    if next_coord.all? {|coord| in_range? coord}
      @current_block.each {|x,y| @board[x][y] = ' '}
      @current_block = next_coord
      @current_block.each {|x,y| @board[x][y] = '@'}
    end
  end

  def block_move_right
    next_coord = @current_block.map {|x,y| x, y = x, y + 1}

    if next_coord.all? {|coord| in_range? coord}
      @current_block.each {|x,y| @board[x][y] = ' '}
      @current_block = next_coord
      @current_block.each {|x,y| @board[x][y] = '@'}
    end
  end

  private

  def in_range?(coord)
    coord[0] >= 0 and coord[0] < @size[0] and
    coord[1] >= 0 and coord[1] < @size[1]
  end

  def block_or_bottom_under(height, board_height)

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



