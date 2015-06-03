class Shape
  attr_accessor :color

  def initialize(color = nil)
    @color = color || 'Red'
  end

  def larger_than?(other_shape)
    area > other_shape.area
  end

end

class Rectangle < Shape
  attr_accessor :width, :height

  def initialize(width, height, color = nil)
    @width, @height = width, height
    super(color)
  end

  def area
    @width * @height
  end

end

class Square < Rectangle

  def initialize(side, color = nil)
    super(side, side, color)
  end

end

class Circle < Shape
  attr_accessor :radius

  def initialize(radius, color = nil)
    @radius = radius
    super(color)
  end

  def area
    Math::PI * (radius ** 2)
  end

end