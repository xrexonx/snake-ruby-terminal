class MyLinkedList
  def initialize(size, x, y)
    @head = MyNode.new(0, x, y, nil)
    if size > 0
      (1..size).each do |i|
        @head = add(i, x, y)
      end
    end
  end

  def add(val, x, y)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = MyNode.new(val, x, y, nil)
  end

  def delete(val)
    current.next = @head
    if current.val == val
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

  def return_list
    elements = []
    current = @head
    while current.next != nil
      elements << current
      current = current.next
    end
    elements << current
  end
end

class MyNode
  attr_accessor :val, :next, :val_x, :val_y

  def initialize(val, x, y, next_node)
    @val = val
    @next = next_node
    @val_x = x
    @val_y = y
  end
end
