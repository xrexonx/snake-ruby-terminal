module Func

  # default snake direction
  @direction = {'row' => 0, 'cell' => 1}

  # catch user input (arrow keys and ESC)
  def Func.user_control
    while true
      input = $stdin.getch
      
      input == "\e" ? input += $stdin.read_nonblock(2) rescue '' : next
      
      case input
      when "\e[A" # up arrow
        @direction = {'row' => -1, 'cell' => 0}
      when "\e[B" # down arrow
        @direction = {'row' => 1, 'cell' => 0}
      when "\e[C" # right arrow
        @direction = {'row' => 0, 'cell' => 1}
      when "\e[D" # left arrow
        @direction = {'row' => 0, 'cell' => -1}
      when "\e"
        Func.game_over
      else
        next
      end
    end
  end
  
  def Func.get_direction
    @direction
  end

  def Func.game_over
    puts "\e[41m\e[30m Game Over \e[0m\n\e[49m\r" 
    exit
  end

end
