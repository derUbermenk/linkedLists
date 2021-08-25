class Node
  attr_accessor :value, :next

  # Initialize a new node
  # @param value [Object] the value inside the node
  # @param next [Node] points to next node in list
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

