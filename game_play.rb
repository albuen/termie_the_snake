require 'time'

class Game_play
  attr_accessor :game_over, :game_speed, :game_paused
  @@board = nil
  @@snake = nil
  @@direction = 1; #1 = right 2 = left 3 = down 4 = up
  @@food_y = nil
  @@food_x = nil
  @@x = nil
  @@y = nil
  def initialize(bord, s_Llist, height, width)
    @game_over = false
    @game_paused = false;
    @@board = bord
    @@snake = s_Llist
    @@food_x = rand(1..(width-2))
    @@food_y = rand(1..(height-2))
    @@x = width
    @@y = height
    @game_speed = 0.2
  end

  def add_food
    @@board.win.setpos(@@food_y, @@food_x)
    @@board.win.attron(color_pair(COLOR_YELLOW)|A_NORMAL){
      @@board.win.addstr("@")
    }
  end

  def ate_food
    if (@@snake.head.x_pos == @@food_x && @@snake.head.y_pos == @@food_y)
      @@board.score+=1
      @@board.level = ((@@board.score/10)+1)
      @@snake.append(@@direction)
      @@food_x = rand(1..(@@x - 2))
      @@food_y = rand(1..(@@y - 2))
      if(@@board.score > 0 && (@@board.score%10) == 0)
        @game_speed = (@game_speed*2)/3;
      end
    end
  end

  def draw_snake
    @node = @@snake.head
    @@board.win.setpos(@node.y_pos, @node.x_pos)
    @@board.win.attron(color_pair(COLOR_RED)|A_NORMAL){
      @@board.win.addstr("O")
    }
    while (@node = @node.next)
      @@board.win.setpos(@node.y_pos, @node.x_pos)
      @@board.win.attron(color_pair(COLOR_RED)|A_NORMAL){
        @@board.win.addstr("#")
      }
    end
  end

  def move_snake
    @node = @@snake.head
    if(@@direction == 1) #RIGHT
      @@snake.add_head(@node.x_pos+1, @node.y_pos)
    elsif (@@direction == 2) #LEFT
      @@snake.add_head(@node.x_pos-1, @node.y_pos)
    elsif (@@direction == 4) #UP
      @@snake.add_head(@node.x_pos, @node.y_pos-1)
    elsif (@@direction == 3) #DOWN
      @@snake.add_head(@node.x_pos, @node.y_pos+1)
    end
    @@snake.del_last
  end

  def check_collision
    #border collision
    if(@@snake.head.x_pos == 0 || @@snake.head.y_pos == 0 || @@snake.head.x_pos == @@x-1 || @@snake.head.y_pos == @@y-1)
      @game_over = true
    end

    @node = @@snake.head
    while(@node = @node.next)
      if(@@snake.head.x_pos == @node.x_pos && @@snake.head.y_pos == @node.y_pos)
        @game_over = true
      end
    end
  end

  def paused_game

    if @game_paused

      sleep(0.1)
      case getch
      when " "
        @game_paused = false
      end
      if @game_paused
        @@board.win.clear
        @@board.win.setpos((@@y-1)/2,(@@x-1)/2)
        @@board.win.addstr("PAUSED")
        @@board.win.refresh
        paused_game
      end
    end

  end

  def player_move
    case getch
    when ?W, ?w  #UP
      if (@@direction!= 3)
        @@direction = 4
      end
    when ?A, ?a  #LEFT
      if (@@direction!= 1)
        @@direction = 2
      end
    when ?S, ?s  #DOWN
      if (@@direction!= 4)
        @@direction = 3
      end
    when ?D, ?d  #RIGHT
      if (@@direction!= 2)
        @@direction = 1
      end
    when ?q  #RIGHT
      exit
    when " "  #space = game_paused
      @game_paused = true
    end
  end
end
