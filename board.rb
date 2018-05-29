class Board
  BLACKSQ = "\xe2\xac\x9b "
  WHITESQ = "\xe2\xac\x9c "
  
  attr_reader :cells
  attr_reader :height_size
  attr_reader :width_size
  attr_accessor :score
  
  def initialize
    @height_size = 30
    @width_size = 40
    @score = 0
    create_field
  end
  
  def create_field
    # populating two dimensional array
    @cells = []
    (0...@height_size).each do |x|
      @row = []
      (0...@width_size).each do |y|
        if x.between?(1, @height_size-2) && y.between?(1, @width_size-2)
          @row.push(WHITESQ)
        else
          @row.push(BLACKSQ)
        end
      end
      @cells.push(@row)
    end
  end
  
  def print_field
    # clear user terminal
    system 'clear'
    # terminal color -> green
    print "\e[32m"
    puts "SCORE: \e[42m\e[30m #{@score} \e[49m\e[32m\r"
    puts "Use \xe2\x87\x84 \xe2\x87\x85 to move, ESC to quit.\r"
    @cells.each do |row|
      row.each do |cell|
        print cell
      end
      # !important - carriege return
      print "\n\r"
    end
    # text == black && background == green
  end
  
end
