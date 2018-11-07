class Enigma

  attr_reader :encryption, :decryption, :cypher

  def initialize
    @encryption = Encryption.new
    @decryption = Decryption.new
    @cypher = Cypher.new
  end

  def encrypt(message, key = @cypher.key_gen, date = @cypher.date_gen)
    message = message.downcase
    date_key = @cypher.get_date_key(date)
    key_cycle = @cypher.generate_key_cycle(key)
    rotation_cypher = @cypher.generate_rotation_cypher(key_cycle, date_key)
    encrypted_message = @encryption.encrypt_message(message, rotation_cypher)
    {
      encryption: encrypted_message,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = date_gen)
    pairs = assign_pairs(message)
    x = crack(pairs)
    date_key = get_date_key(date)
    rotation_cypher = convert_key_and_date(key, date_key)
    require "pry"; binding.pry
    decrypted_message = @decryption.decrypt_message(message, rotation_cypher)
    {
      decryption: decrypted_message,
      key: key,
      date: date
    }
  end

  def assign_pairs(message)
    expected = [" ", "e", "n", "d"].cycle
    require "pry"; binding.pry
    message.chars.inject({}) do |rotations, char|
      rotations[expected.next] = char
      rotations
    end
  end

  def crack(pairs)
    set = @char_set = ("a".."z").to_a << " "
    alph = set.join

    pairs.inject([]) do |rotation, (expected, given)|
      rotation << set.index(expected) - set.index(given)
    end
  end
end
end
