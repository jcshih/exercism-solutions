class Robot
  attr_reader :name

  def initialize
    generate_name
  end

  def reset
    generate_name
  end

  private

  def generate_name
    @name = (random_letter(2) + random_number(3)).join
  end

  def random_letter(n = 1)
    n.times.map { [*'A'..'Z'].sample }
  end

  def random_number(n = 1)
    n.times.map { [*0..9].sample }
  end
end
