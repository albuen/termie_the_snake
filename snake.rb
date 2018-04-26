#!/usr/local/bin/ruby
load 'node.rb'
class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def append(course)
    @x = 74
    @y = 21
    if @head
      if(course == 1) #RIGHT
        @x = find_tail.x_pos-1
        @y = find_tail.y_pos
      elsif(course == 2) #LEFT
        @x = find_tail.x_pos+1
        @y = find_tail.y_pos
      elsif(course == 3) #DOWN
        @x = find_tail.x_pos
        @y = find_tail.y_pos-1
      else #UP
        @x = find_tail.x_pos
        @y = find_tail.y_pos+1

      end
      find_tail.next = Node.new(@x,@y)
    else
      @head = Node.new(@x,@y)
    end
  end

  def add_head(x, y)
    @prev_head = @head
    @head = Node.new(x,y)
    @head.next = @prev_head
  end

  def del_last
    @node = @head
    while (@node = @node.next)
      if(@node.next.next == nil)
        @node.next = nil
      end
    end

  end

  def find_tail
    node = @head

    return node if !node.next
    return node if !node.next while (node = node.next)
  end
end
