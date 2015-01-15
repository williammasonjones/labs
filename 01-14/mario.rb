require 'pry'

module GameOver
  def alive?
    self.lives > 0
  end

  def dead?
    not self.alive?
  end
end

class Mario
  attr_reader
  attr_accessor
  include GameOver

  def initialize

  end
end

class Luigi
  attr_reader
  attr_accessor
  include GameOver

  def initialize

  end
end

class Bowser
  attr_reader
  attr_accessor
  include GameOver
  
  def initialize

  end

end
