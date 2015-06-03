module Presidential

  attr_accessor :name, :age, :citizenship

  def initialize(name, age)
    puts "self in initialize is: #{self.inspect}"
    @name, @age, @citizenship = name, age, self.class.citizenship #instance of all country citizenship
  end

end

class UnitedStatesPresident
  include Presidential

  puts "self in USP is: #{self.inspect}"

  def self.citizenship
    "The United States of America"
  end

end

class FrancePresident
  include Presidential

  def name
    # name = "im local"
    "#{@name}, #{self.catchphrase}"
  end

  def citizenship
    "#{@citizenship}, #{self.catchphrase}"
  end

  def self.citizenship
    "La France"
  end

  def age
    "#{@age}, #{self.catchphrase}"
  end

  def catchphrase
    "bien sur"
  end

end
