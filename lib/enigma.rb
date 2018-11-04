class Enigma < Cypher

  attr_reader :encryption, :decryption, :cypher

  def initialize
    @encryption = Encryption.new
    @decryption = Decryption.new
    # @cypher = Cypher.new
  end

  def encrypt(message, key = key_gen, date = date_gen)
    message = message.downcase
    date_key = get_date_key(date)
    rotation_cypher = convert_key_and_date(key, date_key)
    encrypted_message = @encryption.encrypt_message(message, rotation_cypher)
    {
      encryption: encrypted_message,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = date_gen)
    date_key = get_date_key(date)
    rotation_cypher = convert_key_and_date(key, date_key)
    decrypted_message = @decryption.decrypt_message(message, rotation_cypher)
    {
      decryption: decrypted_message,
      key: key,
      date: date
    }
  end
end
