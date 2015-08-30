# Ruby-snippets

batch_rename: rename all the files with a certain extension within a folder  
Usage: ruby batch_rename.rb [ directory extension [prefix] ]  
Example:  
?> ls test_folder  
987654321_log.txt  logdata123456.txt  output.txt  
?> ruby batch_rename.rb test_folder .txt log_  
?> ls test_folder  
log_1.txt  log_2.txt  log_3.txt  
