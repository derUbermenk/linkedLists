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
    return @head = Node.new(value) if @head.nil?

    # enable this when code blows up

    # starting from current node
    # current_node = self.list_head
    # current_node = self.current_node.next until current_node.next.nil?

    # current_node.next = Node.new(value)
    #

    # fast approach
    # set a next node for current tail
    @list_tail.next = Node.new(value)
    # set the next node as the new tail
    @list_tail = @list_tail.next

    inc_size

    self.to_s
  end

  # adds a new node to the start of the list
  # @param value [Object]
  # @return [String] the new values of LinkedList 
  def prepend(value)
    # create a variable new head, set the next value for that node using current head
    # ... set the new head as the current head

    @list_head = Node.new(value, @list_head)
    inc_size

    self.to_s
  end

  # returns node at given index
  # @param index [Integer]
  # @return [Node] the node at given index
  def at(index)
    case index
    when index.zero? then @head
    when index == size - 1 then tail
    else count_to_index(index)
    end
  end

  # removes the last elements from the list
  # @return [Node]
  def pop
    popped_node = @tail

    # set new tail
    @tail = self.at(size - 1)
    @tail.next = nil

    dec_size
    popped_node
  end

  # represent LinkedLists as strings
  # @return [String]
  def to_s
    initial_list = ''

    until current_node.nil?
      initial_list.concat("( #{current_node.value} ) -> ")
      current_node = current_node.next
    end

    # also add nil value once last element reached 
    initial_list.concat(to_s.current_node.value)
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
  def count_to_index(index_to_find)
    current_node = @head.next
    current_index = 1

    while current_index != index
      current_node = current_node.next
      current_index += 1
    end

    # return value once index is == to current index
    current_node
  end
end

def main
  list = LinkedList.new
  binding.pry
end

main