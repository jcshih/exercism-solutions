-module(sum_of_multiples).
-export([sumOfMultiplesDefault/1, sumOfMultiples/2]).

sumOfMultiples(Factors, N) ->
    lists:sum([X || X <- lists:seq(1, N-1), hasFactor(X, Factors)]).

sumOfMultiplesDefault(N) ->
    sumOfMultiples([3, 5], N).

hasFactor(X, Factors) ->
    lists:any(fun (Factor) -> X rem Factor =:= 0 end, Factors).
