require_relative 'hashable'
require_relative 'shiftable'

class Encryptor
  include Hashable
  include Shiftable

  attr_reader :key,
              :date,
              :message,
              :encoded_message,
              :alphabet

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @encoded_message = []
    @alphabet = ("a".."z").to_a << " "
  end

  def index_start
    message.downcase.split("").map do |letter|
      alphabet.find_index(letter)
    end
  end

  def generate_encoded_message
    index_array = index_start
    shifts = get_shifts
    create_return_hash(encode(index_array, shifts), 'encryption')
  end

  def encode(index_array, shifts)
    encoded_message = []
    index_array.each.with_index do |character, index|
      if character == nil
        encoded_message << message[index]
        next
      end
      offsets = character + shifts[index%4]
      encoded_message << alphabet.rotate(offsets).first
    end
    encoded_message.join
  end
end
