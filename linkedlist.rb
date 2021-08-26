require_relative 'node'
require 'pry-byebug'

class LinkedList
  attr_accessor :head, :tail, :size

  # initialize a new node
  # @param head [Node] the leading node in the list
  def initialize(head = nil)
    @head = head
    # list tail and head are the same when only one node is present
    # ... in the list. Remove this when code blows up
    @tail = head
    @size = 0
  end

  # add a new node containing value to the end of linked list
  # @param value [Object]
  # @return [String] the new value of linkedlist
  def append(value)
    if @head.nil?
      @head = Node.new(value) 
      @tail = @head
    else
      # set a next_node node for current tail
      @tail.next_node = Node.new(value)
      # set the next_node node as the new tail
      @tail = @tail.next_node
    end

    inc_size
    self.to_s
  end

  # adds a new node to the start of the list
  # @param value [Object]
  # @return [String] the new values of LinkedList 
  def prepend(value)
    # create a variable new head, set the next_node value for that node using current head
    # ... set the new head as the current head

    @head = Node.new(value, @head)
    inc_size

    self.to_s
  end

  # returns node at given index
  # @param index [Integer]
  # @return [Node] the node at given index
  def at(index)
    if index.zero?
      @head
    elsif index == @size - 1
      @tail
    else
      count_to_index(index)
    end
  end

  # removes the last elements from the list
  # @return [Node]
  def pop
    popped_tail = @tail

    new_tail = self.at(@size - 2)
    @tail = new_tail
    @tail.next_node = nil

    dec_size
    popped_tail
  end

  # represent LinkedLists as strings
  # @return [String]
  def to_s
    initial_list = ''

    current_node = @head
    until current_node.nil?
      initial_list.concat("( #{current_node.value} ) -> ")
      current_node = current_node.next_node
    end

    # also add nil value once last element reached 
    initial_list.concat('nil')
  end

  private

  # + 1 to size everytime a method
  # ... that adds a node is called
  def inc_size
    @size += 1
  end

  # - 1 to size everytime a method 
  # ... that removes a node is called
  def dec_size
    @size -= 1
  end

  # counts to index starting from head
  # via incrementing
  # @param index [Integer]
  # @return [Node] 
  def count_to_index(index_to_find)
    current_node = @head.next_node
    current_index = 1

    while current_index != index_to_find
      current_node = current_node.next_node
      current_index += 1
    end

    # return value once index is == to current index
    current_node
  end
end

def main
  list = LinkedList.new
  a = list.append(12)
  b = list.append(13)
  c = list.append(15)
  binding.pry
end

main