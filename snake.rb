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
    @sll = MyLinkedList.new(3, @row, @cell)
    @snake = []
    @row = @height_size - 2
    @cell = 1
    (0..3).each do |i| # initialy snake will be 4 squares long
      @cells[@row][@cell + i] = Board::BLACKSQ
      @snake[i] = {'row' => @row, 'cell' => @cell + i}
    end
  end

  def move(direction)
    @direction = direction

    # find out where is a head and a tail of a snake
    @row_tail = @snake[0]['row']
    @cell_tail = @snake[0]['cell']
    @row_head = @snake[@snake.length - 1]['row']
    @cell_head = @snake[@snake.length - 1]['cell']

    # prevent moving backward
    unless @current_direction.nil?
      if @direction.x == @current_direction.x * -1 || @direction.y == @current_direction.y * -1
        @direction = @current_direction
      end
    end

    collision

    # remove tail or eat rabbit
    if @row_head == @rabbit.location['row'] && @cell_head == @rabbit.location['cell']
      @field.score += 1
      @rabbit.create_rabbit
    else
      @cells[@row_tail][@cell_tail] = Board::WHITESQ
      @snake.shift
    end
  end

  def collision
    if @cells[@row_head + @direction.x][@cell_head + @direction.y] == Board::BLACKSQ
      @control.game_over
    else
      @cells[@row_head + @direction.x][@cell_head + @direction.y] = Board::BLACKSQ
      @snake.push('row' => @row_head + @direction.x, 'cell' => @cell_head + @direction.y)
      @current_direction = @direction
    end
  end

end
