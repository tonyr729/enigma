require_relative 'test_helper.rb'

class CypherTest < Minitest::Test
  def setup
    @cypher = Cypher.new
  end

  def test_it_exists
    assert_instance_of Cypher, @cypher
  end

  def test_converts_key_and_date_to_rotation_cypher
    key = "12345"
    key_cycle = key.chars.each_cons(2)
    date_key = "1102"

    actual = @cypher.generate_rotation_cypher(key_cycle, date_key)

    assert_instance_of Enumerator, actual
    assert_equal 13, actual.next
  end

  def test_it_can_generate_a_date
    actual = @cypher.date_gen

    expected = Time.now.strftime("%d%m%y")

    assert_equal expected, actual
    assert_instance_of String, actual
    assert_equal 6, actual.length
    actual.chars.each do |char|
      assert_instance_of Integer, char.to_i
    end
  end

  def test_it_can_generate_a_key
    actual = @cypher.key_gen

    assert_instance_of String, actual
    assert_equal 5, actual.length
    actual.chars.each do |char|
      assert_instance_of Integer, char.to_i
    end
  end

  def test_it_gets_date_key
    date = "021118"
    actual = @cypher.get_date_key(date)

    assert_equal "9924", actual
  end
end
