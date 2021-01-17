require_relative "enigma"
File.open(<filename>, "w")

file = File.open('<filename>', "r")


new_file = File.open('<filename>', "w")
new_file.write("all the text you want")
new_file.close


ARGV == ["red.txt", "blue.txt"]
ARGV[0] == "red.txt"
ARGV[1] == "blue.txt"
