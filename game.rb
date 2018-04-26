#!/usr/local/bin/ruby
load 'board.rb'
load 'game_play.rb'
load 'snake.rb'
require 'time'


@board = Board.new
@snake = LinkedList.new
$i=0
until $i >= 3  do
   @snake.append(1)
   $i +=1;
end
@game_play = Game_play.new(@board, @snake, lines, cols)

begin

  while (@game_play.game_over == false)
      @game_play.paused_game
      @board.drawBoard
      @game_play.player_move
      @game_play.add_food
      @game_play.move_snake
      @game_play.draw_snake
      @game_play.ate_food
      @game_play.check_collision
      @board.win.refresh
      @board.win.clear
      sleep(@game_play.game_speed)
  end

  @board.win.clear
  @board.win.setpos(21,72)
  @board.win.addstr("GAME OVER")
  @board.win.refresh
  sleep(1)

ensure
  print "GAME OVER"
  Curses.close_screen
end
