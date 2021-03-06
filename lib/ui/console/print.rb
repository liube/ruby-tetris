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
    puts '|             w  -  rotate                |'
    puts '|             a  -  move left             |'
    puts '|             s  -  fall faster           |'
    puts '|             d  -  move right            |'
    puts '|             m  -  menu                  |'
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