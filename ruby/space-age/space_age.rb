class SpaceAge
  EARTH_YEAR_SECONDS = 31_557_600.to_f
  PLANET_YEAR_TO_EARTH_YEAR_RATIOS = {
    mercury: 0.2408467,
    venus:   0.61519726,
    mars:    1.8808158,
    jupiter: 11.862615,
    saturn:  29.447498,
    uranus:  84.016846,
    neptune: 164.79132
  }

  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    seconds / EARTH_YEAR_SECONDS
  end

  PLANET_YEAR_TO_EARTH_YEAR_RATIOS.each do |planet, year_ratio|
    define_method "on_#{planet}" do
      on_earth / year_ratio
    end
  end
end
