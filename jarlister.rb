# ruby jar_lister
# this script lists classes ( jar -tf command ) in a given folder.
# adi

puts "\n\n----------\nadi\n\JAR LISTER\n\n"

puts "What is the directory to jar -tf ? " 
jar_dir = gets.chomp
Dir.chdir(jar_dir)
jar_list = Dir.glob("*.jar")
f_out = File.open('jar_list.html','w')
f_out.write("<!DOCTYPE html>\n<html>\n")
jar_list.each do |jar_file|
	puts "\nJAR: " + jar_file + "\n"
	cmd = "jar -tf " + jar_file
	cmd_results =  %x[#{cmd}].inspect.to_s.gsub("\"","").gsub("\\n","\n").gsub("/",".")
	array_of_results = cmd_results.split("\n")
	f_out.write("<h1>" + jar_file + "</h1>\n")
	f_out.write("<ul>\n")
	array_of_results.each do |result|
		f_out.write("\t<li>" + result + "</li>\n")
	end
	f_out.write("</ul>\n")
end
f_out.write("</html>")
f_out.close
