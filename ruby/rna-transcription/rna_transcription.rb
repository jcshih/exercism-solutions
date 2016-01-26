module Complement
  VERSION = 2

  DNA_TO_RNA_MAP = {
    'C' => 'G',
    'G' => 'C',
    'T' => 'A',
    'A' => 'U'
  }
  RNA_TO_DNA_MAP = DNA_TO_RNA_MAP.invert

  module_function

  def of_dna(sequence)
    convert_sequence(sequence, DNA_TO_RNA_MAP)
  end

  def of_rna(sequence)
    convert_sequence(sequence, RNA_TO_DNA_MAP)
  end

  def convert_sequence(sequence, nucleotide_map)
    sequence.each_char.map { |nucleotide|
      nucleotide_map.fetch(nucleotide) {
        fail ArgumentError, "invalid nucleotide #{nucleotide}"
      }
    }.join
  end
end
