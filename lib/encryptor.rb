class Encryptor
  attr_reader :key,
              :date,
              :message,
              :encoded_message,
              :alphabet

  def initialize(message, key, date)
    @message = message.downcase
    @key = key
    @date = date
    @encoded_message = []
    @alphabet = ("a".."z").to_a << " "
  end

  def get_shifts
    test_key = Key.new(key)
    test_offset = Offset.new(date)
    shift = Shift.new(test_key, test_offset)

    test_key.create_keys
    test_offset.create_offset
    shift.generate
  end

end
