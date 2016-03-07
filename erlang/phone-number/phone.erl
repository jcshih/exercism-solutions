-module(phone).
-export([number/1, areacode/1, pretty_print/1]).

-spec number(string()) -> string().
number(S) ->
    Digits = filter_digits(S),
    case length(Digits) of
        10 -> Digits;
        11 -> chop_leading_one(Digits);
        _ -> "0000000000"
    end.

-spec areacode(string()) -> string().
areacode(D) ->
    lists:sublist(D, 3).

-spec pretty_print(string()) -> string().
pretty_print(D) ->
    N = number(D),
    string:join(["(", areacode(N), ") ", 
                 lists:sublist(N, 4, 3), "-", lists:sublist(N, 7, 4)],
                "").

filter_digits(S) ->
    re:replace(S, "\\D", "", [global, {return, list}]).

chop_leading_one([$1|D]) -> D;
chop_leading_one(_) -> "0000000000".
