class Food
  attr_reader :location

  def initialize(board)
    @cells = board.cells
    @height_size = board.height_size
    @width_size = board.width_size
    create_food
  end

  def create_food
    @prng = Random.new
    @x_food = @prng.rand(1..@height_size - 2)
    @prng = Random.new
    @y_food = @prng.rand(1..@width_size - 2)

    # check if rabbit apear on the snake. if so try another random location
    if @cells[@x_food][@y_food] == Board::BLACKSQ
      create_food
    else
      @location = Coordinates.new(@x_food, @y_food)
    end
    @cells[@x_food][@y_food] = "\e[31m#{Board::BLACKSQ}\e[0m\e[32m"
  end
end