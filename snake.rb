class Snake
  def initialize(field, food, control)
    @field = field
    @food = food
    @control = control

    @cells = field.cells
    @height_size = field.height_size
    @width_size = field.width_size
    create_snake
  end

  def create_snake
    @row = @height_size - 2
    @cell = 1
    @snake = MyLinkedList.new(@row, @cell)
    (0..3).each do |i|
      @cells[@row][@cell + i] = Board::BLACKSQ
      @snake.add(@row, @cell + i)
    end
  end

  def move(direction)
    @direction = direction

    @row_tail = @snake.get_first.x
    @cell_tail = @snake.get_first.y
    @row_head = @snake.get_last.x
    @cell_head = @snake.get_last.y

    unless @current_direction.nil?
      if @direction.x == @current_direction.x * -1 || @direction.y == @current_direction.y * -1
        @direction = @current_direction
      end
    end

    collision
  end

  private

  def collision
    collision_x = @row_head + @direction.x
    collision_y = @cell_head + @direction.y
    if @field.check(collision_x, collision_y)
      @control.game_over
    end

    @field.field_black(collision_x, collision_y)
    @snake.add(collision_x, collision_y)
    @current_direction = @direction
    food_collision
  end

  def food_collision
    if @row_head == @food.location.x && @cell_head == @food.location.y
      @field.score += 1
      @food.create_food
    else
      @field.field_white(@row_tail, @cell_tail)
      @snake.delete(@row_tail, @cell_tail)
    end
  end

end
