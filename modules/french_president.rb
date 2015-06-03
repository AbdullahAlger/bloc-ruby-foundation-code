module Presidential

  attr_accessor :name, :age, :citizenship

  def initialize(name, age)
    @name, @age, @citizenship = name, age, self.class.citizenship
  end



end

class UnitedStatesPresident

  include Presidential

  def self.citizenship
    "The United States of America"
  end

end

class FrancePresident

  include Presidential

  def name
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