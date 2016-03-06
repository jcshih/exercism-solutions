-module(anagram).
-export([find/2]).

-spec find(string(), list(string())) -> list(string()).
find(S, Candidates) ->
    Sig = signature(S),
    [C || C <- Candidates, Sig =:= signature(C), S =/= string:to_lower(C)].

-spec signature(string()) -> string().
signature(S) ->
    lists:sort(string:to_lower(S)).
