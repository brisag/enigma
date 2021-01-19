require_relative 'hashable'
require_relative 'shiftable'

class Decryptor
  include Hashable
  include Shiftable
  attr_reader :message,
              :key,
              :date,
              :decoded_message,
              :alphabet

  def initialize(message, key, date)
    @message = message
    @key     = key
    @date    = date
    @decoded_message = []
    @alphabet = ("a".."z").to_a << " "
  end

  def index_start
    message.downcase.split("").map do |letter|
      alphabet.find_index(letter)
    end
  end

  def decode(index_array, shifts)
    decoded_message = []
    index_array.each.with_index do |character, index|
      if character == nil
        decoded_message << message[index]
        next
      end
      generate = character - shifts[index%4]
      decoded_message << alphabet.rotate(generate).first
    end
    decoded_message.join
  end

  def generate_decoded_message
    index_array = index_start
    shifts      = get_shifts
		create_return_hash(decode(index_array, shifts), 'decryption')
	end
end
