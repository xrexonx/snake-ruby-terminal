class Coordinates
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def collide?(coordinate)
    x == coordinate.x && y == coordinate.y
  end
end