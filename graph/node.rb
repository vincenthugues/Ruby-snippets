class Node
  attr_reader :name
  attr_reader :successors
  
  def initialize(name)
    @name = name
    @successors = []
  end
end
