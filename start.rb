require './board.rb'
require './snake.rb'
require './food.rb'
require './controls.rb'
require './linked_list.rb'
require 'io/console'
require './coordinates.rb'

board = Board.new # size
food = Food.new(board)
control = Control.new
snake = Snake.new(board, food, control)

speed = 0
speed = board.score > 0 ? speed - 0.01 : 0.10
Thread.new do
  loop do
    snake.move(control.coordinates)
    board.print_board

    sleep(speed)
  end
end

control.user_input