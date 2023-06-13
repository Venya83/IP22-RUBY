require 'gosu'

class Power
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @image = Gosu::Image.new("materials/power.png")
    @speed = 4
    @counter = 0
    @show_text = false
  end

  def update
    @y += @speed
    show_text_for_frame if @show_text
  end

  def draw
    @image.draw(@x, @y, 0)
    draw_text if @show_text
  end

  def counter
    @counter
  end  

  def hit?(player)
    distance = Gosu.distance(player.x, player.y, @x, @y)
    if distance < 20
      case @counter
      when 0
        @counter = 1
      when 1, 4
        @counter += 4
      when 5
        @counter += 5
      end
      @show_text = true
      return true
    end
    false
  end  

  private

  def draw_text
    return unless @power_text
  
    font = Gosu::Font.new(24)
    font.draw_markup(text_markup, @power.x, @power.y - 30, 0, 1, 1, Gosu::Color::YELLOW)
  end
  
  private
  
  def text_markup
    markup = Gosu::Markup.new
    markup.add_text("+#{@power_text}", Gosu::Color::YELLOW)
    markup
  end    

  def show_text_for_frame
    @counter += 1
    if @counter == 30
      @show_text = false
      @counter = 0
    end
  end
end
