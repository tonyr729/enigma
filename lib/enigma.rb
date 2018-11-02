class Enigma

  attr_reader :encryption, :decryption

  def initialize
    @encryption = Encryption.new
    @decryption = Decryption.new
  end
end
