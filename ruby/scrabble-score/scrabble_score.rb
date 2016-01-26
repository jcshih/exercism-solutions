class Scrabble
  LETTER_SCORES = [
    [%w{A E I O U L N R S T}, 1],
    [%w{D G}, 2],
    [%w{B C M P}, 3],
    [%w{F H V W Y}, 4],
    [%w{K}, 5],
    [%w{J X}, 8],
    [%w{Q Z}, 10]
  ]

  LETTER_SCORE_MAP = Hash[
    LETTER_SCORES.map { |letters, score|
      letters.map { |letter| [letter, score] }
    }.flatten(1)
  ]

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def score
    return 0 if word.nil?
    word
      .upcase
      .scan(/[A-Z]/)
      .map { |letter| LETTER_SCORE_MAP[letter] }
      .reduce(0, :+)
  end

  def self.score(word)
    new(word).score
  end
end
