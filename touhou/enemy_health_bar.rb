class EnemyHealthBar
    def initialize(enemy)
      @enemy = enemy
      @max_health = enemy.hit_counter_limit
      @current_health = @max_health
      @bar_width = 100
      @bar_height = 10
    end
  
    def draw(x, y)
      health_percentage = @current_health.to_f / @max_health
      bar_fill_width = (@bar_width * health_percentage).to_i
  
      Gosu.draw_rect(x, y, @bar_width, @bar_height, Gosu::Color::GRAY)
      Gosu.draw_rect(x, y, bar_fill_width, @bar_height, Gosu::Color::RED)
    end
  
    def update
      @current_health = @enemy.hit_counter
    end
  end
  