class Enemy
  attr_reader :dead

  def initialize(x = 240, y = 480)
    @animation = Gosu::Image.load_tiles("materials/reimu_anim.png", 32, 46)
    @x = x
    @y = y
    @frame_index = 0
    @frame_delay = 5
    @frame_counter = 0
    @direction_horizontal = :right
    @direction_vertical = :down
    @direction_timer = 0
    @direction_duration = 100
    @hit_counter = 0  # Счётчик попаданий
    @dead = false
  end

  def draw
    current_frame.draw(@x - current_frame.width / 2, @y - current_frame.height / 2, 0)
  end

  def move_left
    @x -= 3 if @x > 0
  end

  def move_right
    @x += 3 if @x < 640
  end

  def move_up
    @y -= 3 if @y > 0
  end

  def move_down
    @y += 3 if @y < 480
  end

  def update
    update_frame_index

    # Движение Рейму по горизонтали
    if @direction_timer <= 0
      select_random_horizontal_direction
      @direction_timer = @direction_duration
    else
      @direction_timer -= 1
    end

    if @direction_horizontal == :right
      move_right
      if @x >= 640
        select_random_horizontal_direction
      end
    elsif @direction_horizontal == :left
      move_left
      if @x <= 0
        select_random_horizontal_direction
      end
    end

    # Движение Рейму по вертикали
    if @direction_timer <= 0
      select_random_vertical_direction
      @direction_timer = @direction_duration
    else
      @direction_timer -= 1
    end

    if @direction_vertical == :down
      move_down
      if @y >= 480
        select_random_vertical_direction
      end
    elsif @direction_vertical == :up
      move_up
      if @y <= 0
        select_random_vertical_direction
      end
    end
  end

  def x
    @x
  end

  def y
    @y
  end

  def hit_by_bullet?(bullet)
    if Gosu.distance(bullet.x, bullet.y, @x, @y) < 32  # Проверка на столкновение
      @hit_counter += 1
      if @hit_counter >= 1  #Значение ОЗ Рейму
        @dead = true
      end
      return true
    end
    false
  end

  private

  def current_frame
    @animation[@frame_index]
  end

  def update_frame_index
    @frame_counter += 1
    if @frame_counter >= @frame_delay
      @frame_index = (@frame_index + 1) % @animation.size
      @frame_counter = 0
    end
  end

  def select_random_horizontal_direction
    @direction_horizontal = [:left, :right].sample
  end

  def select_random_vertical_direction
    @direction_vertical = [:up, :down].sample
  end
end
