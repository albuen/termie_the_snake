#!/usr/local/bin/ruby
class Node
  attr_accessor :next, :x_pos, :y_pos

  def initialize(x, y)
    @next  = nil
    @x_pos = x
    @y_pos = y
  end
end
