module Controls

  # default snake direction
  @direction = {'row' => 0, 'cell' => 1}

  # catch user input (arrow keys and ESC)
  def Controls.user_control
    while true
      input = STDIN.getch(min:1)
      # if STDIN.ready?
      #   input = STDIN.getch
      # end
      # input = STDIN.getc

      input == "\e" ? input += STDIN.read_nonblock(2) rescue '' : next

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
        Controls.game_over
      else
        next
      end

      # case input
      # when "w" # up arrow
      #   @direction = {'row' => -1, 'cell' => 0}
      # when "s" # down arrow
      #   @direction = {'row' => 1, 'cell' => 0}
      # when "d" # right arrow
      #   @direction = {'row' => 0, 'cell' => 1}
      # when "a" # left arrow
      #   @direction = {'row' => 0, 'cell' => -1}
      # when "\e"
      #   Controls.game_over
      # else
      #   next
      # end
    end
  end

  def Controls.get_direction
    @direction
  end

  def Controls.game_over
    puts "\e[41m\e[30m Game Over \e[0m\n\e[49m\r"
    exit
  end

end