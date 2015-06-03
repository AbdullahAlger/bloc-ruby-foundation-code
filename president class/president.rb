class President

  attr_accessor :name, :age

  def initialize(name, age)
    @name, @age = name, age
  end

  def citizenship
    self.class.citizenship
  end

end

class FrancePresident < President

  def name
    "#{super}, #{catchphrase}"
  end

  def age
    "#{super}, #{catchphrase}"
  end

  def self.citizenship
    "La France"
  end

  def citizenship
    "#{super}, #{catchphrase}"
  end

  def catchphrase
    "bien sur"
  end

end

class UnitedStatesPresident < President

  def self.citizenship
    "The United States of America"
  end

end

obama = UnitedStatesPresident.new("Barack Obama", 52)
obama.citizenship
