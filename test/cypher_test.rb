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
    date_key = "1102"
    actual = @cypher.convert_key_and_date(key, date_key)

    assert_instance_of Enumerator, actual
    assert_equal 13, actual.next
  end

  def test_it_gets_date_key
    date = "021118"
    actual = @cypher.get_date_key(date)

    assert_equal "9924", actual
  end
end
