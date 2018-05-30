# =====================================================
# Create board/field
# Create snake and food
# Start
# =====================================================

require 'io/console'

require './commands.rb'
require './controls.rb'
require './board.rb'
require './snake.rb'
require './food.rb'

board = Board.new(30) # size
board.create_board

food = Food.new(board)
food.create_food

snake = Snake.new(board, food)
snake.create_snake

# reprint field showing snake motion
Thread.new do
  while true
    snake.move(Controls.get_direction)
    board.print_board
    sleep(0.3) # snake's speed
  end
end

Controls.user_control