#!/usr/local/bin/ruby
load 'board.rb'
require 'curses'
include Curses


@board = Board.new
@board.drawBoard
