require 'pry-byebug'
class Bst
  attr_reader :data
  attr_accessor :left, :right
  def initialize(data)
    @data = data
    @right = nil
    @left = nil
  end

  def insert(new_data)
    current_node = self
    loop do
      if new_data > current_node.data && current_node.right
        current_node = current_node.right
      elsif new_data <= current_node.data && current_node.left
        current_node = current_node.left
      elsif new_data > current_node.data && current_node.right == nil
        current_node.right = Bst.new(new_data)
        return current_node.right
      elsif new_data <= current_node.data && current_node.left == nil
        current_node.left = Bst.new(new_data)
        return current_node.left
      end
    end
  end

  def each(&block)
    return to_enum(:each) unless block_given?

    left.each(&block) if left
    yield(data)
    right.each(&block) if right
  end


end
