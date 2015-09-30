require_relative('node')
require_relative('vertex')
require_relative('adjacency_matrix')
require_relative('parser')

class Graph
  Edge = Struct.new(:src, :dest, :weight)
  
  attr_reader :graph_type
  
  def initialize(graph_type=:undirected, filename = '')
    @graph_type = graph_type
    @nodes = {} # actual graph nodes
    @vertices = [] # used to store/search
    @edges = [] # used to store/search
    @adjacency_matrix = nil
    
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
    
    # Parse the file
    sectionsResults = parser.get_data(filename)
    # Store the results
    sectionsResults.each_pair do |section_name, results|
      case section_name
      when 'Vertices'
        results.each { |line| add_vertex line[1], line[2], line[3] }
      when 'Edges'
        results.each { |line| add_edge line[1], line[2], line[3] }
      end
    end
    
    @adjacency_matrix = AdjacencyMatrix.new(@vertices, @edges, @graph_type)
  end
  
  def add_vertex(name, x, y)
    @vertices << Vertex.new(name, x.to_i, y.to_i)
    @nodes[name] = Node.new(name)
  end

  def add_edge(src, dest, weight = 0)
    @edges << Edge.new(src, dest, weight.to_i)
    @nodes[src].add_next(@nodes[dest])
  end
  
  def [](node_name)
    @nodes[node_name]
  end
  
  def print_adjacency_matrix
    @adjacency_matrix.print_matrix
  end
  
  def print_vertices
    @vertices.each { |vertex| puts "[Vertex] name:\"#{vertex.name}\", x:#{vertex.x}, y:#{vertex.y}" }
  end
  
  def print_edges
    @edges.each { |edge| puts "[Edge] from:\"#{edge.src}\", to:\"#{edge.dest}\", weight:#{edge.weight}" }
  end
  
  def print_nodes
    @nodes.each_value do |node|
      print "[Node] name:\"#{node.name}\", next:\""
      
      node.next.each_index do |index|
        print node.next[index].name
        print ", " unless index + 1 == node.next.size # only if we're not at the last index
      end
      
      print "\"\n"
    end
  end
end
