require_relative('graph')

def main
  graph = Graph.new(graph_type = :directed, filename = 'input/test1.txt')
  
  # graph.add_vertex("a", 0, 0)
  # graph.add_vertex("b", 1, 2)
  # graph.add_edge("a", "b", 1)
  
  puts 'Vertices:'
  graph.print_vertices
  
  puts "\nNodes:"
  graph.print_nodes
  
  puts "\nEdges:"
  graph.print_edges
  
  puts "\nAdjacency matrix:"
  graph.print_adjacency_matrix
end

main
