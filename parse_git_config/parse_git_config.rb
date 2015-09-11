class Parser
      def initialize(path)
      	  @path = path
      end

      def print_file
      	  File.open(@path).each do |line| puts line end
      end

      def print_matches(pattern)
      	  File.open(@path).each { |line|
	      line.match(pattern) { |result| puts result[1] }
	  }
      end
end

def main
    parser = Parser.new('../.git/config')

    puts 'Branches:'
    parser.print_matches /\[branch \"(.*)\"\]/
end

main
