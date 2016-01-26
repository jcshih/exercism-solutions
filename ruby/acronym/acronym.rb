module Acronym
  VERSION = 1

  def self.abbreviate(str)
    str
      .scan(/[A-Z]+[a-z]*|[a-z]+/)
      .map { |w| w[0] }
      .join
      .upcase
  end
end
