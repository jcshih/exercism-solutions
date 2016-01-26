module Nucleotide
  module_function

  def from_dna(sequence)
    fail ArgumentError, 'Invalid sequence' unless sequence.scan(/[^ACGT]/).empty?
    DNA.new(sequence)
  end

  class DNA
    attr_reader :nucleotides

    def initialize(sequence)
      @nucleotides = sequence.chars
    end

    def count(nucleotide)
      nucleotides.count(nucleotide)
    end

    def histogram
      Hash[%w{A C G T}.map { |n| [n, count(n)] }]
    end
  end
end
