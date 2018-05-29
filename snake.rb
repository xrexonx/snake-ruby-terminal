class Snake
  def initialize(field, rabbit)
    @field = field
    @rabbit = rabbit

    @cells = field.cells
    @height_size = field.height_size
    @width_size = field.width_size
  end

  def create_snake
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
      if @direction['row'] == @current_direction['row'] * -1 || @direction['cell'] == @current_direction['cell'] * -1
        @direction = @current_direction
      end
    end


    if @cells[@row_head + @direction['row']][@cell_head + @direction['cell']] == Board::BLACKSQ
      Func.game_over
    else
      @cells[@row_head + @direction['row']][@cell_head + @direction['cell']] = Board::BLACKSQ
      @snake.push('row' => @row_head + @direction['row'], 'cell' => @cell_head + @direction['cell'])
      @current_direction = @direction
    end

    # remove tail or eat rabbit
    if @row_head == @rabbit.location['row'] && @cell_head == @rabbit.location['cell']
      @field.score += 1
      @rabbit.create_rabbit
    else
      @cells[@row_tail][@cell_tail] = Board::WHITESQ
      @snake.shift
    end
  end

end
