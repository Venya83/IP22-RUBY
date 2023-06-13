require 'gosu'

class GameOverRestart
  def initialize(game_window)
    @game_window = game_window
    @game_over_image = Gosu::Image.new("materials/game_over.png")
    @restart_button_image = Gosu::Image.new("materials/restart_button.png", :tileable => true, :width => 64, :height => 64)
  end

  def draw
    @game_over_image.draw(0, 0, 0)
    @restart_button_image.draw(361 - @restart_button_image.width / 2, 300, 0, 0.5, 0.5)   # Положение и размер кнопки рестарта
  end

  def button_down(id)
    if id == Gosu::KB_R && @game_window.game_over
      @game_window.restart_game
    elsif id == Gosu::MS_LEFT && @game_window.game_over
      if restart_button_clicked?
        @game_window.restart_game
      end
    end
  end
  
  def restart_button_clicked?
    mouse_x = @game_window.mouse_x
    mouse_y = @game_window.mouse_y
    restart_button_width = @restart_button_image.width
    restart_button_height = @restart_button_image.height
    restart_button_x = 320 - restart_button_width / 2  # Положение коллизии кнопки рестарта по горизонтали
    restart_button_y = 310 - restart_button_height / 2   # Положение коллизии кнопки рестарта по вертикали
  
    if mouse_x > restart_button_x && mouse_x < restart_button_x + restart_button_width &&
       mouse_y > restart_button_y && mouse_y < restart_button_y + restart_button_height
      return true
    else
      return false
    end
  end
end
