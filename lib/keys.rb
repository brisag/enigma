class Key
  attr_reader :key,
              :a_key,
              :b_key,
              :c_key,
              :d_key

  def initialize(key)
    @key   = key
    @a_key = 0
    @b_key = 0
    @c_key = 0
    @d_key = 0
  end

  def create_keys
		keys   = @key.split("")
		@a_key = keys[0..1].inject(:+).to_i
		@b_key = keys[1..2].inject(:+).to_i
		@c_key = keys[2..3].inject(:+).to_i
		@d_key = keys[3..4].inject(:+).to_i
	end
end
