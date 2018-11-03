class Encryption
  def encrypt_message(message, key, date)
    date_key = get_date_key(date)
    rotation_cypher = convert_key_and_date(key, date_key)
    set = @char_set.join
    encrypted = message.chars.map do |char|
      cypher_set = @char_set.rotate(rotation_cypher.next).join
      char.tr(set, cypher_set)
    end
    encrypted.join
  end
end
