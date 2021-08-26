class Node
  attr_accessor :value, :next_node

  # Initialize a new node
  # @param value [Object] the value inside the node
  # @param next_node [Node] points to next_node node in list
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

