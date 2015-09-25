class AdjacencyMatrix

  def initialize(vertices, edges, graph_type)
    @tab = Array.new(vertices.count) { Array.new(vertices.count, 0) }
    
    generate(vertices, edges, graph_type)
  end
  
  def generate(vertices, edges, graph_type)
    edges.each do |edge|
      src_index = vertices.find_index { |vertex| vertex.name == edge.src }
      dest_index = vertices.find_index { |vertex| vertex.name == edge.dest }
      
      @tab[src_index][dest_index] += 1
      @tab[dest_index][src_index] += 1 unless graph_type == :directed
    end
  end
  
  def print_matrix
    @tab.each { |row| puts row.inspect }
  end
  
end
