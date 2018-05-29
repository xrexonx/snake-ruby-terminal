class Food
  attr_reader :location

  def initialize(field)
    @cells = field.cells
    @height_size = field.height_size
    @width_size = field.width_size
    create_rabbit
  end

  def create_rabbit
    @prng = Random.new
    @row_rabbit = @prng.rand(1..@height_size - 2)
    @prng = Random.new
    @cell_rabbit = @prng.rand(1..@width_size - 2)

    # check if rabbit apear on the snake. if so try another random location
    if @cells[@row_rabbit][@cell_rabbit] == Board::BLACKSQ
      create_rabbit
    else
      @location = Coordinates.new(@row_rabbit, @cell_rabbit)
    end
    @cells[@row_rabbit][@cell_rabbit] = "\e[31m#{Board::BLACKSQ}\e[0m\e[32m"
  end
end
