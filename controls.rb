class Control

  attr_accessor :coordinates

  def initialize
    self.coordinates = Coordinates.new(0, 1)
  end

  def user_input
    while true
      input = $stdin.getch

      if input == "\e"
        u_input = $stdin.read_nonblock(2)
        if u_input != ''
          input += u_input
        else
          next
        end
      end

      case input
        when "\e[A" # up arrow
          self.coordinates = Coordinates.new(-1, 0)
        when "\e[B" # down arrow
          self.coordinates = Coordinates.new(1, 0)
        when "\e[C" # right arrow
          self.coordinates = Coordinates.new(0, 1)
        when "\e[D" # left arrow
          self.coordinates = Coordinates.new(0, -1)
        when "\e"
          game_over
        else
          next
      end
    end
  end

  def game_over
    puts "\e[41m\e[30m Game Over \e[0m\n\e[49m\r"
    exit
  end

end
