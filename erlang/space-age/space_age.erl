-module(space_age).
-export([ageOn/2]).

-define(PlanetYearsInEarthYears,
        [
         {mercury, 0.2408467},
         {venus, 0.61519726},
         {earth, 1},
         {mars, 1.8808158},
         {jupiter, 11.862615},
         {saturn, 29.447498},
         {uranus, 84.016846},
         {neptune, 164.79132}
        ]).

-define(PlanetYearsInSeconds, 
        lists:map(fun ({P, Y}) -> {P, Y * 31557600} end, 
                  ?PlanetYearsInEarthYears)).

ageOn(Planet, Seconds) ->
    Seconds / proplists:get_value(Planet, ?PlanetYearsInSeconds).
