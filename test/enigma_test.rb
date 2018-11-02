require 'test_helper.rb'


class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_encryption
    assert_instance_of Encryption, @enigma.encryption
  end

  def test_it_has_decryption
    assert_instance_of Decryption, @enigma.decryption
  end
end
