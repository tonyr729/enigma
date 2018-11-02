require 'test_helper.rb'

class EncryptionTest < Minitest::Test
  def setup
    @encryption = Encryption.new
  end

  def test_it_exists
    assert_instance_of Encryption, @encryption
  end

  def test_it_can_encrypt_message
    skip
    message = "hello world end"
    key = "12345"
    date = Time.now.strftime("%Y%m%d")

    actual = @encryption.encrypt_message(message, key, date)

    assert_instance_of String, actual
    assert_equal message.length, actual.length
    refute message = actual
  end
end
