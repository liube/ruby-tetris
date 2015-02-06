module Print
  def display_menu
    puts '___________________________________________'
    puts '|                                  _      |'
    puts '|              NEW GAME  [n]      | |_    |'
    puts '|    _           SAVE    [s]      |_  |   |'
    puts '|   | |___       LOAD    [l]        |_|   |'
    puts '|   |_____|  HIGH SCORES [h]              |'
    puts '|                MENU    [m]    ___       |'
    puts '|              CONTROLS  [c]   |   |      |'
    puts '|                QUIT    [q]   |___|      |'
    puts '|_________________________________________|'
  end

  def show_controls
    puts '___________________________________________'
    puts '|                                         |'
    puts '|                CONTROLS                 |'
    puts '|                                         |'
    puts '|        left arrow  -  move left         |'
    puts '|       right arrow  -  move right        |'
    puts '|          up arrow  -  rotate            |'
    puts '|        down arrow  -  fall faster       |'
    puts '|                 m  -  menu              |'
    puts '|_________________________________________|'
  end

  def print_board(board)
    puts "          ____________\n"
    puts "#{board.map {|row| row.join("").
                             prepend("          |").
                             concat("|")}.
                             join("\n")}"
    puts "          ''''''''''''\n"
  end
end

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

def new_game(board = Board.new.board)
  t1 = Time.now
  print_board(board)
  n = 1

  while true
    t2 = Time.now
    t_interval = t2 - t1

    char = (Win32API.new('crtdll', '_kbhit', [ ], 'I').Call.zero? ?
            nil :
            Win32API.new('crtdll', '_getch', [ ], 'L').Call)

    if t_interval >= 0.8
      system 'cls'
      print_board(board)
      puts "#{n += 1}. Interval: #{t_interval}"
      t1 = Time.now
    end

    unless char.nil?
      break if char.chr == 'm'
    end
  end
end




