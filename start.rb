require './board.rb'
require './snake.rb'
require './food.rb'
require './controls.rb'
require './linked_list.rb'
require 'io/console'
require './coordinates.rb'

field = Board.new # size
food = Food.new(field)
control = Control.new
snake = Snake.new(field, food, control)

speed = 0
speed = field.score > 0 ? speed - 0.01 : 0.10
Thread.new do
  loop do
    snake.move(control.coordinates)
    field.print_field

    sleep(speed)
  end
end

control.user_input
