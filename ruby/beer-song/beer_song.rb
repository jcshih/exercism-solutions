class BeerSong
  def verse(n)
    b = Beer.bottles(n)
    result = ''
    result << b.measure.capitalize << ' of beer on the wall, '
    result << b.measure << ' of beer.' << "\n"
    result << b.action << ', '
    result << b.pred.measure << ' of beer on the wall.' << "\n"
    result
  end

  def verses(start, finish)
    start.downto(finish).map { |n| verse(n) }.join("\n") + "\n"
  end

  def sing
    verses(99, 0)
  end
end

module Beer
  def self.bottles(n)
    { 0 => Zero.new,
      1 => One.new
    }.fetch(n) { Number.new(n) }
  end

  class Number
    attr_reader :n

    def initialize(n)
      @n = n
    end

    def pronoun
      'one'
    end

    def action
      "Take #{pronoun} down and pass it around"
    end

    def measure
      "#{n} bottles"
    end

    def pred
      Beer.bottles(n - 1)
    end
  end

  class Zero < Number
    def initialize
      super(0)
    end

    def action
      'Go to the store and buy some more'
    end

    def measure
      'no more bottles'
    end

    def pred
      Beer.bottles(99)
    end
  end

  class One < Number
    def initialize
      super(1)
    end

    def pronoun
      'it'
    end

    def measure
      "#{n} bottle"
    end
  end
end
