class Node
  attr_reader :name
  attr_reader :next
  
  def initialize(name)
    @name = name
    @next = []
  end
  
  def add_next node
    @next << node
  end
end
