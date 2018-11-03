class Cypher

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  def convert_key_and_date(key, date_key)
    key_cycle = key.chars.each_cons(2)
    rotation = date_key.chars.map {|num| key_cycle.next.join.to_i + num.to_i}
    rotation.cycle
  end

  def get_date_key(date)
    date = date.sub!(/^0/, "") if date[0] == "0"
    (date.to_i ** 2).to_s[-4..-1]
  end

end
