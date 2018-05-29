class Snake
  def initialize(field, rabbit, control)
    @field = field
    @rabbit = rabbit
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
    (0..3).each do |i| # initialy snake will be 4 squares long
      @cells[@row][@cell + i] = Board::BLACKSQ
      @snake.add(@row, @cell + i)
    end
  end

  def move(direction)
    @direction = direction

    # find out where is a head and a tail of a snake
    @row_tail = @snake.get_first.x
    @cell_tail = @snake.get_first.y
    @row_head = @snake.get_last.x
    @cell_head = @snake.get_last.y

    # prevent moving backward
    unless @current_direction.nil?
      if @direction.x == @current_direction.x * -1 || @direction.y == @current_direction.y * -1
        @direction = @current_direction
      end
    end

    collision

    food_collision
  end

  def collision
    if @cells[@row_head + @direction.x][@cell_head + @direction.y] == Board::BLACKSQ
      @control.game_over
    else
      @cells[@row_head + @direction.x][@cell_head + @direction.y] = Board::BLACKSQ
      @snake.add(@row_head + @direction.x, @cell_head + @direction.y)
      @current_direction = @direction
    end
  end

  def food_collision
    if @row_head == @rabbit.location.x && @cell_head == @rabbit.location.y
      @field.score += 1
      @rabbit.create_rabbit
    else
      @cells[@row_tail][@cell_tail] = Board::WHITESQ
      @snake.delete(@row_tail, @cell_tail)
    end
  end

end
