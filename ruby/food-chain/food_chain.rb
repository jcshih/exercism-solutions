module Recitable
  def opening
    "I know an old lady who swallowed a #{self}."
  end

  def closing
    "I don't know why she swallowed the #{self}. Perhaps she'll die."
  end

  def swallowed(collateral)
    "She swallowed the #{collateral} to catch the #{self}."
  end
end

module Animal
  ANIMALS = [
    { name: :fly },
    { name: :spider,
      secondary_opening: 'It wriggled and jiggled and tickled inside her.',
      swallow_embellish: 'that wriggled and jiggled and tickled inside her.' },
    { name: :bird,
      secondary_opening: 'How absurd to swallow a bird!' },
    { name: :cat,
      secondary_opening: 'Imagine that, to swallow a cat!' },
    { name: :dog,
      secondary_opening: 'What a hog, to swallow a dog!' },
    { name: :goat,
      secondary_opening: 'Just opened her throat and swallowed a goat!' },
    { name: :cow,
      secondary_opening: 'I don\'t know how she swallowed a cow!' },
    { name: :horse,
      closing_override: 'She\'s dead, of course!' }
  ]

  ANIMALS.each do |animal|
    klass = Class.new do
      include Recitable

      define_method :to_s do
        animal[:name].to_s
      end

      define_method :opening do
        "#{super()}\n#{animal[:secondary_opening]}"
      end if animal.key?(:secondary_opening)

      define_method :swallowed do |*args|
        "#{super(*args).chop} #{animal[:swallow_embellish]}"
      end if animal.key?(:swallow_embellish)

      define_method :closing do
        "#{animal[:closing_override]}"
      end if animal.key?(:closing_override)
    end

    const_set animal[:name].to_s.capitalize, klass
  end

  module_function

  def get_class(name)
    const_get(name.to_s.capitalize)
  end

  def classes
    ANIMALS.map { |a| Animal.get_class(a[:name]).new }
  end
end

class FoodChain
  VERSION = 2

  class << self
    def song
      animal_classes = Animal.classes
      1.upto(animal_classes.size)
        .map { |i| animal_classes.slice(0, i) }
        .map(&:reverse)
        .tap { |animals| animals << [animals.pop.first] }
        .map { |animals| verse(animals) }
        .join("\n")
    end

    private

    def verse(animals)
      <<-eos.gsub(/^\s+/, '')
        #{animals.first.opening}
        #{middle(animals)}
        #{animals.last.closing}
      eos
    end

    def middle(animals)
      animals
        .each_cons(2)
        .map { |a, b| b.swallowed(a) }
        .join("\n")
    end
  end
end
