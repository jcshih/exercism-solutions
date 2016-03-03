-module(strain).
-export([keep/2, discard/2]).

-spec keep(function(), list()) -> list().
keep(F, L) ->
    [X || X <- L, F(X)].

-spec discard(function(), list()) -> list().
discard(F, L) ->
    [X || X <- L, not F(X)].
