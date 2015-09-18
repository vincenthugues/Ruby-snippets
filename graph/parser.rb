class Parser
  def initialize
    @sections = []
  end

  def add_section(name, pattern)
    @sections << Struct.new(:name, :pattern).new(name, pattern)
  end

  def print_file(path)
    File.open(path).each { |line| puts line }
  end

  def match_pattern(line, section)
    vertex_line = /vertex\s+(?<Name>\S+)\s+(?<XCoordinate>\d+)\s+(?<YCoordinate>\d+)/
    edge_line = /edge\s+(?<Origin>\S+)\s+(?<Destination>\S+)\s+(?<Weight>\d+)/
    
    parts = line.match(vertex_line)
    
    if parts then
      puts "Parts: ", parts

      # puts "
      #   Name: #{parts['Name']}
      #   X: #{parts['XCoordinate']}
      #   Y: #{parts['YCoordinate']}".strip
    end
  end

  def get_data(path)
    # Create the arrays to hold the results for each section
    sectionsResults = {}
    @sections.each do |section|
      #sectionsResults << Struct.new(:name, :results).new(section.name, [])
      sectionsResults[section.name] = []
    end

    # Get the results from the file
    unless @sections.empty?
      # For each line in the file
      File.open(path).each do |line|
        # For each "section" to populate
        @sections.each do |section|
          # If there is a match, store the results
          #line.match(section.pattern) { |results| sectionsResults[section.name] = results }
          line.match(section.pattern) { |result| sectionsResults[section.name] << result[1] }
          #match_pattern(line, section)
        end
      end
    end
    
    return sectionsResults
  end

  def print_sections(path)
    sectionsResults = get_data(path)

    # Display the results
    sectionsResults.each_pair do |section_name, results|
      puts section_name + ':'
      results.each { |result| puts ' ' * 4 + result }
    end
  end
end
