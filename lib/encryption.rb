class Encryption
  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def encrypt_message(message, key, date)
    date_key = get_date_key(date)
    rotation_cypher = convert_key_and_date(key, date_key)
    require "pry"; binding.pry
  end
end
