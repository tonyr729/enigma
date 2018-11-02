class Encryption
  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def encrypt_message(message, key, date)
    date_key = get_date_key(date)
    rotation_cypher = convert_key_and_date(key, date_key)
  end

  def get_date_key(date)
    date = date.sub!(/^0/, "") if date[0] == "0"
    x = (date.to_i ** 2).to_s[-4..-1].to_i
  end
end
