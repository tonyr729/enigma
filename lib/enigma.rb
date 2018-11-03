class Enigma

  attr_reader :encryption, :decryption, :cypher

  def initialize
    @encryption = Encryption.new
    @decryption = Decryption.new
    @cypher = Cypher.new
  end

  def encrypt(message, key, date)
    @encryption.encrypt_message(message, key, date)
  end
end
