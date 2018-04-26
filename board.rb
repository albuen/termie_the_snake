#!/usr/local/bin/ruby

require "curses"
include Curses
Curses.init_screen
Curses.cbreak
Curses.noecho
Curses.cbreak
Curses.stdscr.nodelay = 1
Curses.start_color
Curses.init_pair(COLOR_RED,COLOR_BLUE,COLOR_GREEN)
Curses.init_pair(COLOR_RED,COLOR_RED,COLOR_RED)
Curses.init_pair(COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW)
class Board
  attr_accessor :win, :level, :score

  def initialize
    @win = Window.new((lines), cols, 0, 0)
    @level = 1
    @score = 0
  end

  def drawBoard
    curs_set(0)
    @win.box(?*, ?*)

    @win.setpos(42, 0)
    @win.addstr(" [q] quit [space] pause [w] move UP [s] move DOWN [d] move RIGHT [a] move LEFT ")

    @win.setpos(0, ((cols/2)-12))
    @win.addstr(" TERMIE THE RUBY SNAKE ")

    @win.setpos(0, 1)
    @win.addstr(" LEVEL: "+@level.to_s+" ")

    @win.setpos(0, (cols-15))
    @win.addstr(" SCORE: "+@score.to_s+" ")

    @win.setpos(42, (cols-20))
    @win.addstr(" ALBUEN JAN ROSELLO ")
  end
end
