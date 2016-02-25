const PLANET_EARTH_YEARS = {
  mercury: 0.2408467,
  venus: 0.61519726,
  earth: 1,
  mars: 1.8808158,
  jupiter: 11.862615,
  saturn: 29.447498,
  uranus: 84.016846,
  neptune: 164.79132
};

class SpaceAge {
  constructor(age) {
    this.age = age;
  }

  get seconds() {
    return this.age;
  }

  secondsToPlanetYears(planet) {
    const planetYears = this.age / 31557600 / PLANET_EARTH_YEARS[planet];
    return parseFloat(planetYears.toFixed(2));
  }

  onMercury() {
    return this.secondsToPlanetYears('mercury');
  }

  onVenus() {
    return this.secondsToPlanetYears('venus');
  }

  onMars() {
    return this.secondsToPlanetYears('mars');
  }

  onEarth() {
    return this.secondsToPlanetYears('earth');
  }

  onJupiter() {
    return this.secondsToPlanetYears('jupiter');
  }

  onSaturn() {
    return this.secondsToPlanetYears('saturn');
  }

  onUranus() {
    return this.secondsToPlanetYears('uranus');
  }

  onNeptune() {
    return this.secondsToPlanetYears('neptune');
  }
}

export default SpaceAge;
