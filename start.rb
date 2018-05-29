require './board.rb'
require './snake.rb'
require './food.rb'
require './controls.rb'
require './linked_list.rb'
require 'io/console'
require './coordinates.rb'

# puts Func.get_direction

field = Board.new # size
food = Food.new(field)
control = Control.new
snake = Snake.new(field, food, control)

# reprint field showing snake motion
speed = field.score > 0 ? field.score / 10 : 0.10
Thread.new do
  loop do
    snake.move(control.get_direction)
    field.print_field

    sleep(speed) # snake's speed
  end
end

# catch user input (arrow keys and ESC)
control.user_input
