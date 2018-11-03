class Enigma

  attr_reader :encryption, :decryption, :cypher

  def initialize
    @encryption = Encryption.new
    @decryption = Decryption.new
    @cypher = Cypher.new
  end

  def encrypt(message, key, date)
    date_key = @cypher.get_date_key(date)
    rotation_cypher = @cypher.convert_key_and_date(key, date_key)
    encrypted_message = @encryption.encrypt_message(message, rotation_cypher)
    {
    encryption: encrypted_message,
    key: key,
    date: date
    }
  end
end
