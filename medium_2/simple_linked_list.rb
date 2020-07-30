class Element
  attr_accessor :datum, :next
  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    !@next
  end
end

class SimpleLinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def empty?
    !@head
  end

  def peek
    @head ? @head.datum : nil
  end

  def push(data)
    new_node = Element.new(data)
    unless @head
      @head = new_node
      return
    end
    new_node.next = @head
    @head = new_node
  end

  def size
    count = 0
    current_node = @head
    while current_node
      current_node = current_node.next
      count += 1
    end
    count
  end

  def pop
    return unless @head
    data = @head.datum
    @head = @head.next
    data
  end

  def self.from_a(array)
    list = self.new
    return list unless array.instance_of?(Array)
    array = array.clone
    until array.empty?
      list.push(array.pop)
    end
    list
  end

  def to_a
    result = []
    current_node = @head
    while current_node
      result << current_node.datum
      current_node = current_node.next
    end
    result
  end

  def reverse
    result = SimpleLinkedList.new
    current_node = @head
    while current_node
      result.push(current_node.datum)
      current_node = current_node.next
    end
    result
  end
end

 
  