require 'test_helper.rb'

class DecryptionTest < Minitest::Test
  def setup
    @decryption = Decryption.new
  end

  def test_it_exists
    assert_instance_of Decryption, @decryption
  end

  def test_it_can_decrypt_a_message
    message = "igoppbzssngdfpg"
    cypher = [1, 2, 3, 4].cycle

    actual = @decryption.decrypt_message(message, cypher)

    assert_equal "hello world end", actual
  end
end
