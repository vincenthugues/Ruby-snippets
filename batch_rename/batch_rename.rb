def prompt_user()
	print 'Directory: '
	directory = gets.strip
	directory << '/' unless directory.end_with?('/')

	print 'File extension (ex: .jpg): '
	extension = gets.strip

	print 'Prefix (ex: DSC_): '
	prefix = gets.strip
	
	return directory, extension, prefix
end

def rename_files(directory, extension, prefix)
	n = 0
	Dir[directory + '*'].each do |f|
		next if File.directory? f
		
		if File.extname(File.basename(f)) == extension
			filename = File.basename(f, extension)
			new_filename = f.gsub(filename, prefix + (n+1).to_s)
			
			print "Renaming " + f + " to " + new_filename + "\n"
			File.rename(f, new_filename)
			
			n += 1
		end
	end
	
	puts "Renamed " + n.to_s + " files"
end

def batch_rename()
	directory, extension, prefix = "", "", ""

	if not [0, 3].include? ARGV.length
		puts "Usage: ruby batch_rename.rb [directory extension prefix]"
		return
	end
	
	if ARGV.length == 3
		directory = ARGV.shift
		extension = ARGV.shift
		prefix = ARGV.shift
	end

	if directory.empty? or extension.empty? or prefix.empty?
		user_input = prompt_user
		rename_files *user_input
	else
		rename_files directory, extension, prefix
	end
end

batch_rename
