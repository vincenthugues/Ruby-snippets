require_relative('vertex')

class Graph
  Edge = Struct.new(:src, :dest, :weight)
  
  attr_accessor :type
  
  def initialize(graph_type=:undirected)
    @type = graph_type
    @vertices = []
    @edges = []
  end
  
  def add_vertex(name, x, y)
    @vertices << Vertex.new(name, x, y)
  end

  def add_edge(src, dest, weight = 0)
    @edges << Struct.new(:src, :dest, :weight).new(src, dest, weight)
  end
end
