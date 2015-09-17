require_relative('graph')
require_relative('parser')

def main
  graph = Graph.new(:undirected)
  graph.add_vertex("a", 0, 0)
  graph.add_vertex("b", 1, 2)
  graph.add_edge("a", "b", 1)
  
  parser = Parser.new

  parser.add_section('Vertices', /vertex (.*)/)
  parser.add_section('Edges', /edge (.*)/)

  parser.print_sections('input/test1.txt')
end

main
