class Phrase
  VERSION = 1

  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    phrase
      .downcase
      .scan(/\w+\'?(?=\w)\w*|\w/)
      .group_by { |w| w }
      .each_with_object({}) { |(k, v), h| h[k] = v.size }
  end
end
