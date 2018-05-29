class Food
  attr_reader :location

  def initialize(field)
    @cells = field.cells
    @height_size = field.height_size
    @width_size = field.width_size
    create_food
  end

  def create_food
    @prng = Random.new
    @x_rabbit = @prng.rand(1..@height_size - 2)
    @prng = Random.new
    @y_rabbit = @prng.rand(1..@width_size - 2)

    # check if rabbit apear on the snake. if so try another random location
    if @cells[@x_rabbit][@y_rabbit] == Board::BLACKSQ
      create_food
    else
      @location = Coordinates.new(@x_rabbit, @y_rabbit)
    end
    @cells[@x_rabbit][@y_rabbit] = "\e[31m#{Board::BLACKSQ}\e[0m\e[32m"
  end
end
