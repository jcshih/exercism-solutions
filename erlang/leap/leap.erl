-module(leap).
-export([leap_year/1]).

-spec leap_year(integer()) -> boolean().
leap_year(Y) when is_integer(Y) ->
    case Y rem 4 of
        0 -> case Y rem 100 of
                 0 -> Y rem 400 =:= 0;
                 _ -> true
             end;
        _ -> false
    end.
