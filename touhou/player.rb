class Player
  attr_reader :x, :y
  def initialize
    @animation = Gosu::Image.load_tiles("materials/cirno_anim.png", 32, 40)
    @x = 320
    @y = 400
    @frame_index = 0
    @frame_delay = 5  # Задержка между сменой кадров
    @frame_counter = 0
    @direction = 1  # Направление анимации: 1 - слева-направо, -1 - справа-налево
  end

  def draw
    current_frame.draw(@x - current_frame.width / 2, @y - current_frame.height / 2, 0)
  end

  def move_left
    @x -= 5 if @x > 0
  end

  def move_right
    @x += 5 if @x < 640
  end

  def move_up
    @y -= 5 if @y > 0
  end

  def move_down
    @y += 5 if @y < 480
  end

  def update
    update_frame_index
  end

  private

  def current_frame
    @animation[@frame_index]
  end

  def update_frame_index
    @frame_counter += 1
    if @frame_counter >= @frame_delay
      @frame_index += @direction
      if @frame_index >= @animation.size || @frame_index < 0
        @direction *= -1
        @frame_index += @direction * 2
      end
      @frame_counter = 0
    end
  end
end
