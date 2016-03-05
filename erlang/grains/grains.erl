-module(grains).
-export([square/1, total/0]).

-spec square(pos_integer()) -> pos_integer().
square(N) ->
    trunc(math:pow(2, N-1)).

-spec total() -> pos_integer().
total() ->
    lists:foldl(fun(X, Sum) -> square(X) + Sum end, 0, lists:seq(1, 64)).
