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

  def match_pattern(line, pattern)
    line.match(pattern) { |results| return results.to_a }
  end

  def get_data(path)
    # Create the arrays to hold the results for each section
    sectionsResults = {}
    @sections.each do |section|
      sectionsResults[section.name] = []
    end

    # Get the results from the file
    unless @sections.empty?
      # For each line in the file
      File.open(path).each do |line|
        # For each "section" to populate
        @sections.each do |section|
          # If there is a match, store the results
          results = match_pattern(line, section.pattern)
          if results then
            sectionsResults[section.name] << results
          end
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
      results.each { |line| puts ' ' * 4 + line[1..-1].to_s } # Display all but the first element
    end
  end
end
