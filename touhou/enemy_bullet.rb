require 'gosu'

class EnemyBullet
  def initialize(x, y, speed_x, speed_y)
    @image = Gosu::Image.new("materials/reimu_bullet.png")
    @x = x
    @y = y
    @velocity_x = speed_x * 5
    @velocity_y = speed_y * 5
  end

  def draw
    angle = Math.atan2(@velocity_y, @velocity_x) * 180 / Math::PI
    @image.draw_rot(@x, @y, 0, angle)
  end

  def move
    @x += @velocity_x
    @y += @velocity_y
  end

  def hit?(player)
    distance = Gosu.distance(@x, @y, player.x, player.y)
    distance < 10
  end

  def self.release(enemy, player)
    speed_x = player.x - enemy.x
    speed_y = player.y - enemy.y
    speed = Gosu.distance(0, 0, speed_x, speed_y)
    speed_x /= speed
    speed_y /= speed

    enemy_bullet = EnemyBullet.new(enemy.x, enemy.y, speed_x * 5, speed_y * 5)
    return enemy_bullet
  end

  def x
    @x
  end

  def y
    @y
  end
end
