require_relative 'test_helper.rb'


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

  def test_it_has_cypher
    assert_instance_of Cypher, @enigma.cypher
  end

  def test_it_calls_encryption_of_a_message
    skip
    # message = "hello world end"
    # key = "12345"
    # date = Time.now.strftime("%d%m%dy")
    #
    # mocked_enigma = mock("enigma")
    # mocked_enigma.responds_like(Enigma.new)
    #
    # mocked_enigma.stubs(:encryption).returns("success")
    # mocked_enigma.expects(:encryption)
    # @enigma.encrypt(message, key, date)
  end
end
