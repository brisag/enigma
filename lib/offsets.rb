class Offset
  attr_reader :date,
              :a_offset,
              :b_offset,
              :c_offset,
              :d_offset

  def initialize(date)
    @date     = date
    @a_offset = 0
    @b_offset = 0
    @c_offset = 0
    @d_offset = 0
  end

  def create_offset
    offset    = ((date.to_i)*(date.to_i)).to_s.split("")
    @a_offset = offset[-4].to_i
    @b_offset = offset[-3].to_i
    @c_offset = offset[-2].to_i
    @d_offset = offset.last.to_i
  end
end
