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

  def print_sections(path)
    # Create the arrays to hold the results for each section
  sectionsResults = {}
  @sections.each do |section|
    #sectionsResults << Struct.new(:name, :results).new(section.name, [])
    sectionsResults[section.name] = []
  end

  # Get the results from the file
      unless @sections.empty?
    File.open(path).each do |line|
      @sections.each do |section|
        line.match(section.pattern) { |result| sectionsResults[section.name] << result[1] }
      end
    end
  end

  # Display the results
  sectionsResults.each_pair do |section_name, results|
    puts section_name + ':'
    results.each { |result| puts ' ' * 4 + result }
  end
  end
end
