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

user_input = prompt_user

rename_files *user_input
