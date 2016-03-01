-module(accumulate).
-export([accumulate/2]).

accumulate(F, L) -> accumulate(F, L, []).

accumulate(_, [], R) -> lists:reverse(R);
accumulate(F, [H|T], R) ->
    accumulate(F, T, [F(H)|R]).
