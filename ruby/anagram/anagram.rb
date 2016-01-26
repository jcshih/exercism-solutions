class Anagram
  attr_reader :word
  attr_reader :word_signature

  def initialize(word)
    @word = word
    @word_signature = gen_sig(word)
  end

  def match(candidates)
    candidates
      .reject { |w| w.downcase == word.downcase }
      .select { |s| gen_sig(s) == word_signature }
  end

  def gen_sig(word)
    word.downcase.chars.sort.join
  end
end
