module Clock
  def self.at(hour = 0, minute = 0)
    Time.new(hour, minute)
  end

  class Time
    def initialize(hour, minute)
      @hour = hour
      @minute = minute
    end

    def to_s
      "#{pad(hour)}:#{pad(minute)}"
    end

    def +(other)
      carry, new_minute = (minute + other).divmod 60
      new_hour = (hour + carry) % 24
      Time.new(new_hour, new_minute)
    end

    def -(other)
      carry, new_minute = (minute - other).divmod 60
      new_hour = (hour + carry) % 24
      Time.new(new_hour, new_minute)
    end

    def ==(other)
      to_s == other.to_s
    end

    private

    attr_reader :hour, :minute

    def pad(n)
      n.to_s.rjust(2, '0')
    end
  end
end
