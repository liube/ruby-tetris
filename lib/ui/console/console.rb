def start
  choice = ''
  while choice != 'q'
    case choice
      when 'n' then new_game
      when 's' then puts 'Save game'
      when 'l' then puts 'Load game'
      when 'h' then puts 'High scores'
      when 'm' then 'prints menu'
      when 'c' then show_controls
    end

    display_menu
    print 'Your choice: '
    choice = gets.chomp
  end
end

def new_game(new_board = Board.new)
  t1 = Time.now
  print_board(new_board.board)
  n = 1

  while true
    t2 = Time.now
    time_interval = t2 - t1

    if time_interval >= 0.8
      system 'cls'

      new_board.block_fall

      if new_board.current_block.nil?
        new_board.add_block_at_coords(random_block_at_top)
      end

      print_board(new_board.board)
      puts "#{n += 1}. Interval: #{time_interval}"

      t1 = Time.now
    end

    input = get_input

    unless input.nil?
      case input.chr
        when 'm' then break
        when 'a' then alter_board(new_board) {|board| board.block_move_left}
        when 'd' then alter_board(new_board) {|board| board.block_move_right}
      end
    end
  end
end

def alter_board(board)
  system 'cls'
  yield board
  print_board(board.board)
end

def get_input
  Win32API.new('crtdll', '_kbhit', [ ], 'I').Call.zero? ?
            nil :
            Win32API.new('crtdll', '_getch', [ ], 'L').Call
end





