#!/usr/local/bin/ruby
load 'board.rb'
load 'game_play.rb'
load 'snake.rb'
require 'time'


@board = Board.new
@snake = LinkedList.new
#lines = height : cols = width
$i=0
until $i >= 3  do
   @snake.append(1)
   $i +=1;
end
@game_play = Game_play.new(@board, @snake, lines, cols)

begin

  while (@game_play.game_over == false)
      @board.drawBoard
      @game_play.player_move
      @game_play.add_food
      @game_play.move_snake
      @game_play.draw_snake
      @game_play.check_collision
      @board.win.refresh
      @board.win.clear
      sleep(@game_play.game_speed)
  end

ensure
  print "GAME OVER"
  Curses.close_screen
end
