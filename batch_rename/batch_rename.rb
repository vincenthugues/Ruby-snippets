print 'Directory: '
directory = gets.strip
directory << '/' unless directory.end_with?('/')

print 'File extension (ex: .jpg): '
extension = gets.strip

print 'Prefix (ex: DSC_): '
prefix = gets.strip

i = 1
Dir[directory + '*'].each do |f|
	next if File.directory? f
	
	if File.extname(File.basename(f)) == extension
		filename = File.basename(f, extension)
		new_filename = f.gsub(filename, prefix + i.to_s)
		puts "Renaming " + f + " to " + new_filename
		File.rename(new_filename)
	end
	
	i += 1
end
