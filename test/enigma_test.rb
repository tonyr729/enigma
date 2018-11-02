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

  def test_it_calls_encryption_of_a_message
    encryption = mock("encryption")
    mock.stubs(:encrypt_message).returns('Sdfbg Zadrt')

    message = "hello world end"
    key = "12345"
    date = Time.now.strftime("%d%m%dy")

    @enigma.encrypt(message, key, date)

    encryption.expects(:encrypt_message).returns('Sdfbg Zadrt')
  end
end
