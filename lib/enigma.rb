class Enigma

  attr_reader :encryption, :decryption

  def initialize
    @encryption = Encryption.new
    @decryption = Decryption.new
  end

  def encrypt(message, key, date)
    @encryption.encrypt_message(message, key, date)
  end
end
