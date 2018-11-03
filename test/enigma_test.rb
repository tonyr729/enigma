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

  def test_it_encrypts_message
    message = "hello world end"
    key = "12345"
    date = Time.now.strftime("%d%m%y")

    expected = {
      encryption: "bjugieejlqmvzsm",
      key: key,
      date: date
    }
    actual = @enigma.encrypt(message, key, date)
    assert_equal expected, actual
  end

  def test_it_can_generate_a_key
    actual = @enigma.key_gen

    assert_instance_of String, actual
    assert_equal 5, actual.length
    actual.chars.each do |char|
      assert_instance_of Integer, char.to_i
    end
  end

  def test_it_can_generate_a_date
    actual = @enigma.date_gen

    expected = Time.now.strftime("%d%m%y")

    assert_equal expected, actual
    assert_instance_of String, actual
    assert_equal 6, actual.length
    actual.chars.each do |char|
      assert_instance_of Integer, char.to_i
    end
  end

  def test_it_can_encrypt_a_message_without_a_date
    message = "hello world end"
    key = "12345"
    date = Time.now.strftime("%d%m%y").sub!(/^0/, "")

    expected = {
      encryption: "bjugieejlqmvzsm",
      key: key,
      date: date
    }
    actual = @enigma.encrypt(message, key)
    assert_equal expected, actual
  end

  def test_it_can_encrypt_a_message_without_a_date_or_key
    message = "hello world end"
    date = Time.now.strftime("%d%m%y").sub!(/^0/, "")

    actual = @enigma.encrypt(message)
    assert_instance_of String, actual[:encryption]
    assert_equal message.length, actual[:encryption].length
    assert_instance_of String, actual[:key]
    assert_equal 5, actual[:key].length
    assert_equal date, actual[:date]
  end

  def test_it_can_encrypt_a_message_case_insensative
    message = "Hello World End"
    key = "12345"
    date = "31118"

    actual = @enigma.encrypt(message, key, date)
    assert_equal "bjugieejlqmvzsm", actual[:encryption]
  end

  def test_it_can_encrypt_a_message_with_symbols
    message = "Hello! World! End!"
    key = "12345"
    date = "31118"

    actual = @enigma.encrypt(message, key, date)
    assert_equal "bjugi!iriwuz!eniy!", actual[:encryption]
  end

  def test_it_can_decrypt_a_message
    message = "bjugieejlqmvzsm"
    key = "12345"
    date = Time.now.strftime("%d%m%y").sub!(/^0/, "")

    expected = {
      decryption: "hello world end",
      key: key,
      date: date
    }
    actual = @enigma.decrypt(message, key, date)
    assert_equal expected, actual
  end

  def test_it_can_decrypt_a_message_with_only_a_key
    message = "bjugieejlqmvzsm"
    key = "12345"
    date = Time.now.strftime("%d%m%y").sub!(/^0/, "")

    expected = {
      decryption: "hello world end",
      key: key,
      date: date
    }
    actual = @enigma.decrypt(message, key)
    assert_equal expected, actual
  end
end
