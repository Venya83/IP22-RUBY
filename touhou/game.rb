require 'gosu'
require_relative 'player'
require_relative 'enemy'
require_relative 'bullet'
require_relative 'enemy_bullet'
require_relative 'background'
require_relative 'game_over'
require_relative 'powers'

class GameWindow < Gosu::Window
  attr_reader :game_over

  def initialize
    super(640, 480)
    self.caption = "Getting Over It with Cirno®"
    @background = Background.new
    @player = Player.new
    @enemy = Enemy.new(320, 240)
    @player_bullets = []
    @enemy_bullets = []
    @player_bullet_delay = 10
    @player_bullet_delay_counter = 0
    @enemy_bullet_delay = 15
    @enemy_bullet_delay_counter = 0
    @game_over = false
    @game_over_restart = GameOverRestart.new(self)
    @powers = []
    @display_power_text = false
    @power_text_counter = 0
    @power_text = ''
    @power_text_x = 0
    @power_text_y = 0
  end

  def update
    return if @game_over

    @background.update

    @player.move_left if Gosu.button_down?(Gosu::KB_LEFT)
    @player.move_right if Gosu.button_down?(Gosu::KB_RIGHT)
    @player.move_up if Gosu.button_down?(Gosu::KB_UP)
    @player.move_down if Gosu.button_down?(Gosu::KB_DOWN)

    @player.update

    if @enemy
      @enemy.update

      # Запуск пуль Рейму
      if @enemy_bullet_delay_counter <= 0
        target_x = @player.x
        target_y = @player.y
        dx = target_x - @enemy.x
        dy = target_y - @enemy.y
        angle = Math.atan2(dy, dx)
        speed_x = Math.cos(angle)
        speed_y = Math.sin(angle)
        @enemy_bullets << EnemyBullet.new(@enemy.x, @enemy.y, speed_x, speed_y)
        @enemy_bullet_delay_counter = @enemy_bullet_delay
      end

      if @enemy.dead
        random_power_count = rand(2..5)
        random_power_count.times do
          power_x = @enemy.x + rand(-30..30)
          power_y = @enemy.y + rand(-30..30)
          @powers << Power.new(power_x, power_y)
        end

        @enemy = nil
      end
    end

    @enemy_bullets.each do |enemy_bullet|
      enemy_bullet.move
      if enemy_bullet.hit?(@player)
        @game_over = true
      end
    end

    if Gosu.button_down?(Gosu::KB_Z) && @player_bullet_delay_counter <= 0
      @player_bullets << Bullet.new(@player.x, @player.y)
      @player_bullet_delay_counter = @player_bullet_delay
    end

    @player_bullets.each do |bullet|
      bullet.move
      if @enemy && @enemy.hit_by_bullet?(bullet)
        @player_bullets.delete(bullet)
      end
    end

    @powers.each do |power|
      power.update
      if power.hit?(@player)
        @powers.delete(power)
        @display_power_text = true
        @power_text_counter = 30
        power = @powers.sample
        @power_text = "+" + [power&.counter, 5, 10].compact.reject(&:zero?).sample.to_s      
        @power_text_x = power&.x || 0
        @power_text_y = power&.y.to_i - 30
      end
    end

    @player_bullet_delay_counter -= 1
    @enemy_bullet_delay_counter -= 1

    update_power_text
  end

  def draw
    @background.draw
    @player.draw
  
    if @enemy
      @enemy.draw
    end
  
    @player_bullets.each(&:draw)
    @enemy_bullets.each(&:draw)
  
    @powers.each(&:draw)
  
    if @display_power_text
      font = Gosu::Font.new(24)
      font.draw_text(@power_text, @power_text_x, @power_text_y, 0, 1, 1, Gosu::Color::YELLOW)
    end
  
    if @game_over
      @game_over_restart.draw
    end
  end  

  def button_down(id)
    @game_over_restart.button_down(id)
  end

  def restart_game
    @player = Player.new
    @enemy = Enemy.new(320, 240)
    @player_bullets = []
    @enemy_bullets = []
    @player_bullet_delay_counter = 0
    @enemy_bullet_delay_counter = 0
    @game_over = false
    @powers = []
  end

  private

  def show_power_text(power)
    if power.show_text
      @power_text = "+#{power.counter}"
      power_counter = power.counter
      case power_counter
      when 1
        power_counter_text = "+1"
      when 5
        power_counter_text = "+5"
      when 10
        power_counter_text = "+10"
      else
        power_counter_text = ""
      end
      font = Gosu::Font.new(24)
      font.draw(power_counter_text, power.x, power.y - 30, 0, 1, 1, Gosu::Color::YELLOW)
    end
  end  

  def update_power_text
    if @display_power_text
      @power_text_counter -= 1
      if @power_text_counter <= 0
        @display_power_text = false
      end
    end
  end
end

window = GameWindow.new
window.show
