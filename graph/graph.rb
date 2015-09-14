require_relative('parser')

def main
  parser = Parser.new

  parser.add_section('Vertices', /vertex (.*)/)
  parser.add_section('Edges', /edge (.*)/)

  parser.print_sections('input/test1.txt')
end

main
