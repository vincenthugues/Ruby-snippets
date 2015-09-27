class Vertex
  attr_reader :name
  attr_accessor :x
  attr_accessor :y
  
  def initialize(name, x, y)
    @name = name
    @x = x
    @y = y
  end
end
