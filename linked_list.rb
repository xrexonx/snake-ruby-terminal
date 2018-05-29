class MyLinkedList
  def initialize(x, y)
    @head = MyNode.new(x, y, nil)
  end

  def add(x, y)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = MyNode.new(x, y, nil)
  end

  def delete(x,y)
    current = @head
    if current.x == x && current.y == y
      @head = current.next
    else
      while current.next.nil? && current.next.val != val
        current = current.next
      end
      unless current.next == nil
        current.next = current.next.next
      end
    end
  end

  def get_first
    @head
  end

  def get_last
    current = @head
    while current.next != nil
      current = current.next
    end
    current
  end

end

class MyNode
  attr_accessor :next, :x, :y

  def initialize(x, y, next_node)
    @next = next_node
    @x = x
    @y = y
  end
end
