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
    key = "12345"
    date = Time.now.strftime("%Y%m%d")

    actual = @encryption.encrypt_message(message, key, date)

    assert_instance_of String, actual
    assert_equal message.length, actual.length
    refute message == actual
  end

  def test_converts_key_and_date_to_rotation_cypher
    key = "12345"
    date_key = "1102"
    actual = @encryption.convert_key_and_date(key, date_key)

    assert_instance_of Enumerator, actual
    assert_equal 13, actual.next
  end

  def test_it_gets_date_key
    date = "021118"
    actual = @encryption.get_date_key(date)

    assert_equal "9924", actual
  end
end
