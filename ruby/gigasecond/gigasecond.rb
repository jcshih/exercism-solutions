module Gigasecond
  VERSION = 1

  module_function

  def from(time)
    time + 10**9
  end
end
