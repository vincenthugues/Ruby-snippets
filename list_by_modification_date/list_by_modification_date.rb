require 'optparse'

def list_files(directory, options)
	if not directory.empty?
		# Expand the path in case it points inside the user's home directory
		directory = File.expand_path(directory)
		# Ensure the directory ends with a slash
		directory << '/' unless directory.end_with?('/')
		
		# Check that the directory exists
		if not Dir.exists? directory
			puts "Directory \"#{directory}\" not found"
			return
		end
	end
	
	Dir[directory + '*'].sort_by { |f| File.mtime f }.each do |f|
		s = ''
		s += File.mtime(f).to_s + "\t" unless options[:time] != true
		puts s + f
	end
end

def list_by_modification_date(options)
	# Use the current directory by default
	directory = ''

	if ARGV.length == 1
		directory = ARGV.shift.strip
	end
	
	list_files directory, options
end

def get_options
	options = {}
	
	OptionParser.new do |opts|
	  opts.banner = "Usage: list_by_modification_date.rb [options]"

	  opts.on("-t", "--time", "Show last modification date") do |t|
		options[:time] = t
	  end
	end.parse!
	
	return options
end

options = get_options
list_by_modification_date options
