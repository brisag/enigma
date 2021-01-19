require './lib/enigma'
require './lib/keys'
require './lib/offsets'
require './lib/shift'
require './lib/encryptor'

handle = File.open(ARGV[0], "r")

incoming_text = handle.read.strip

handle.close

enigma = Enigma.new
writer = File.open(ARGV[1], "w")

writer.write(enigma.encrypt(incoming_text))
writer.close

puts "Created '#{ARGV[1]}' with the key #{enigma.key} and the date #{enigma.date}"
