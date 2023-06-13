require 'gosu'

class Bullet
  attr_reader :x, :y

  def initialize(x, y)
    @image = Gosu::Image.new("materials/cirno_bullet.png")
    @x = x
    @y = y
  end

  def draw
    @image.draw(@x - @image.width / 2, @y - @image.height / 2, 0)
  end

  def move
    @y -= 10
  end
end
