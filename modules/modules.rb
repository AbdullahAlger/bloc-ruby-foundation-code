module Location
  attr_accessor :x, :y

  def set_location(x, y)
    @x, @y = x, y
  end

  def distance_to(other)
    dx = self.x - other.x
    dy = self.y - other.y
    Math.sqrt(dx ** 2 + dy ** 2)
  end

  def wurr_u_at
    puts "#{self.name} is at (#{x},#{y})"
  end

end

class Person
  attr_accessor :name

  include Location
end

class City
  include Location
end

a = Person.new
a.name = "Georgia"
a.set_location(2,3)

b = City.new
b.x = 5
b.y = 7

a.distance_to(b)
a.wurr_u_at

b.wurr_u_at