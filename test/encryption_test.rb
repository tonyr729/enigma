require 'test_helper.rb'

class EncryptionTest < Minitest::Test
  def setup
    @encryption = Encryption.new
  end

  def test_it_exists
    assert_instance_of Encryption, @encryption
  end

  def test_it_can_encrypt_message
    message = "hello world end"
    cypher = [1, 2, 3, 4].cycle

    actual = @encryption.encrypt_message(message, cypher)

    assert_equal "igoppbzssngdfpg", actual
  end

end
