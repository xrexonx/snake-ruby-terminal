class Food
  attr_reader :location
  def initialize(board)
    @cells = board.cells
    @size = board.size
  end

  def create_food
    @prng = Random.new
    @row_food = @prng.rand(1..@size - 2)
    @prng = Random.new
    @cell_food = @prng.rand(1..@size - 2)

    # check if rabbit apear on the snake. if so try another random location
    if @cells[@row_food][@cell_food] == Board::BLACKSQ
      create_food
    else
      @location = {'row' => @row_food, 'cell' => @cell_food}
    end
    @cells[@row_food][@cell_food] = "\e[31m#{Board::BLACKSQ}\e[0m\e[32m"
  end
end