require_relative "enigma"
message = File.open(ARGV[0], "r")

require "pry"; binding.pry

incoming_text = message.read
incoming_text = incoming_text.gsub("\n", "")
message.close

enigma = Enigma.new(incoming_text)
encrypted_text = enigma.encrypt

cipher = File.open(ARGV[1], "w")

cipher.write(encrypted_text[:message])
cipher.close
puts "Created '#{ARGV[1]}' with the key #{new_enigma.key} and the date #{new_enigma.date}"
