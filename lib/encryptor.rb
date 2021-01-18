class Encryptor
  attr_reader :alphabet,
              :todays_date,
              :random_key

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @todays_date = (DateTime.now.strftime "%d%m%y").to_i
    @random_key = rand(5 ** 5).to_s.rjust(5,'0')
  end

  def last_four_digits(date = nil)
    if date == nil
      square_date(@todays_date).to_s.slice!(-4..-1).to_i
    else
      square_date(date).to_s.slice!(-4..-1).to_i
    end
  end

  def square_date(date = nil)
    if date == nil
      @todays_date * @todays_date
    else
      date.to_i * date.to_i
    end
  end
end

#
#   def apply_shifts
#     test_key = Key.new(key)
#     test_offset = Offset.new(date)
#     shift = Shift.new(test_key, test_offset)
#
#     test_key.create_keys
#     test_offset.create_offset
#     shift.generate
#   end
# end
