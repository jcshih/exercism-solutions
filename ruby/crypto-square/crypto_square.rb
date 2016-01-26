class Crypto
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def normalize_plaintext
    message
      .downcase
      .gsub(/[^a-z0-9]/, '')
  end

  def size
    (normalize_plaintext.size**0.5).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext_segments
    0.upto(size - 1)
      .map { |i| plaintext_segments.map { |seg| seg[i] } }
      .map(&:join)
  end

  def ciphertext
    ciphertext_segments.join
  end

  def normalize_ciphertext
    ciphertext_segments.join(' ')
  end
end
