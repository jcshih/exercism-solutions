-module(dna).
-export([hamming_distance/2]).

-spec hamming_distance(string(), string()) -> integer().
hamming_distance(A, B) ->
    hamming_distance(A, B, 0).

-spec hamming_distance(string(), string(), integer()) -> integer().
hamming_distance([], [], R) -> R;
hamming_distance([HA|TA], [HB|TB], R) ->
    if
        HA =:= HB ->
            hamming_distance(TA, TB, R);
        true ->
            hamming_distance(TA, TB, R+1)
    end.
