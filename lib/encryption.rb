class Encryption

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def encrypt_message(message, rotation_cypher)
    set = @char_set.join
    encrypted = message.chars.map do |char|
      cypher_set = @char_set.rotate(rotation_cypher.next).join
      char.tr(set, cypher_set)
    end
    encrypted.join
  end
end
