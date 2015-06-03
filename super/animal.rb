class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def eat(other)
    puts "#{@name} ate #{other.name}! #{noise}"
  end
end

class Human < Animal
  attr_accessor :catchphrase

  def initialize(name, catchphrase)
    super(name)
    @catchphrase = catchphrase
  end

  def noise
    @catchphrase
  end
end

a = Human.new("Adam", "Right on!")
b = Animal.new("Chicken")
a.eat(b)

class Englishman < Human
  def initialize(name = "Mick Jagger")
    super(name, "I can't get no....")
  end
end

mick = Englishman.new
mick.eat(a)

class Dog < Animal
  attr_accessor :excitment_level

  def initialize(name, excitment_level)
    super(name)
    @excitment_level = excitment_level
  end

  def noise
    "woof" * @excitment_level
  end
end

d = Dog.new("Henry", 3)
a.eat(d)
