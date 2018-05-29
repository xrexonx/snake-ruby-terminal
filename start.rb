require './board.rb'
require './snake.rb'
require './food.rb'
require './controls.rb'
require 'io/console'

# puts Func.get_direction

field = Board.new # size

rabbit = Food.new(field)
rabbit.create_rabbit

snake = Snake.new(field, rabbit)
snake.create_snake()

# reprint field showing snake motion
speed = field.score > 0 ? field.score / 10 : 0.10
Thread.new do
  loop do
    snake.move(Func.get_direction)
    field.print_field

    sleep(speed) # snake's speed
  end
end

# catch user input (arrow keys and ESC)
Func.user_control
