
def list_files(directory)
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
	
	Dir[directory + '*'].sort_by { |f| File.mtime f }.each { |f| puts File.mtime(f).to_s + "\t" + f }
end

def list_by_modification_date()
	# Use the current directory by default
	directory = ''

	if ARGV.length == 1
		directory = ARGV.shift.strip
	end
	
	list_files directory
end

list_by_modification_date
