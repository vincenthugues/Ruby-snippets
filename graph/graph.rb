require_relative('vertex')
require_relative('parser')

class Graph
  Edge = Struct.new(:src, :dest, :weight)
  
  attr_accessor :type
  
  def initialize(graph_type=:undirected, filename = '')
    @type = graph_type
    @vertices = []
    @edges = []
    
    unless filename.empty? then build_from_file(filename) end
  end
  
  def build_from_file(filename)
    parser = Parser.new
    
    # Handle vertices ("vertex <Name> <XCoordinate> <YCoordinate>")
    parser.add_section(
      'Vertices',
      /
        vertex
        \s+
        (?<Name>\S+)
        \s+
        (?<XCoordinate>-?\d+)
        \s+
        (?<YCoordinate>-?\d+)
      /x)
    
    # Handle edges ("edge <Origin> <Destination> <Weight>")
    parser.add_section(
      'Edges',
      /
        edge
        \s+
        (?<Origin>\S+)
        \s+
        (?<Destination>\S+)
        \s+
        (?<Weight>-?\d+)
      /x)
    
    parser.print_sections(filename)
  end
  
  def add_vertex(name, x, y)
    @vertices << Vertex.new(name, x, y)
  end

  def add_edge(src, dest, weight = 0)
    @edges << Struct.new(:src, :dest, :weight).new(src, dest, weight)
  end
end
