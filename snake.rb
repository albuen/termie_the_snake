#!/usr/local/bin/ruby
load 'node.rb'
class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def append(x,y)
    if @head
      find_tail.next = Node.new(x,y)
    else
      @head = Node.new(x,y)
    end
  end

  def find_tail
    node = @head

    return node if !node.next
    return node if !node.next while (node = node.next)
  end
end
