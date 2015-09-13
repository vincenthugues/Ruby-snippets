require_relative('parser')

def main
  parser = Parser.new

  parser.add_section('Remotes', /\[remote \"(.*)\"\]/)
  parser.add_section('Branches', /\[branch \"(.*)\"\]/)

  parser.print_sections('../.git/config')
end

main
