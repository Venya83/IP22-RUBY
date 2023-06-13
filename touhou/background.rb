class Background
    def initialize
      @image = Gosu::Image.new("materials/bg.png", tileable: true)
      @y = 0
      @speed = 5
    end
  
    def update
      @y += @speed
      @y = 0 if @y >= @image.height
    end
  
    def draw
      @image.draw(0, @y, 0)
      @image.draw(0, @y - @image.height, 0)
    end
  end
