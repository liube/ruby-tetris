require "c:/tetris/lib/tetris/version"
require "c:/tetris/lib/ui/console/console.rb"
require "c:/tetris/lib/ui/gui/gui.rb"
require 'Win32API'

include Print

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

class Board
  attr_reader :board
  attr_accessor :current_block

  def initialize(board = starting_board)
    @board = board
    add_block_at_coords(random_block)
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
end

def random_block
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

def impossible_position

end




