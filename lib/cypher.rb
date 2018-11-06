class Cypher

  def generate_rotation_cypher(key_cycle, date_key)
    rotation = date_key.chars.map do |num|
      key_rotation = key_cycle.next.join.to_i
      offset = num.to_i
      key_rotation + offset
    end
    rotation.cycle
  end

  def generate_key_cycle(key)
    key.chars.each_cons(2)
  end

  def get_date_key(date)
    date = date.sub!(/^0/, "") if date[0] == "0"
    (date.to_i ** 2).to_s[-4..-1]
  end

  def key_gen
    ("1".."99999").to_a.sample.rjust(5, "0")
  end

  def date_gen
    Time.now.strftime("%d%m%y")
  end

end
