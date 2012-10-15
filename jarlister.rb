# ruby jar_lister
# this script lists classes ( jar -tf command ) in a given folder.
# adi

puts "\n\n----------\nadi\n\JAR LISTER\n\n"

puts "What is the directory to jar -tf ? " 
jar_dir = gets.chomp
Dir.chdir(jar_dir)
jar_list = Dir.glob("*.jar")
f_out = File.open('jar_list.html','w')
jar_list.each do |jar_file|
	puts "\nJAR: " + jar_file + "\n"
	cmd = "jar -tf " + jar_file
	cmd_results =  %x[#{cmd}].inspect.to_s
	cmd_results = cmd_results.gsub("\"","")
	cmd_results = cmd_results.gsub("\\n","\n")
	array_of_results = cmd_results.split("\n")
	f_out.write("<h1>" + jar_file + "</h1>")
	f_out.write("<ul>")
	array_of_results.each do |result|
		f_out.write("<li>" + result + "</li>")
	end
	f_out.write("</ul>")
end
f_out.close
