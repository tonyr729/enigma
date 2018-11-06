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

  def decrypt(message, key, date = @cypher.date_gen)
    date_key = @cypher.get_date_key(date)
    key_cycle = @cypher.generate_key_cycle(key)
    rotation_cypher = @cypher.generate_rotation_cypher(key_cycle, date_key)
    decrypted_message = @decryption.decrypt_message(message, rotation_cypher)
    {
      decryption: decrypted_message,
      key: key,
      date: date
    }
  end
end
