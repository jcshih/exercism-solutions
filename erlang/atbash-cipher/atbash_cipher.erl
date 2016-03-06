-module(atbash_cipher).
-export([encode/1, decode/1]).

-spec encode(string()) -> string().
encode(Str) ->
    string:join(chunk(convert(Str), 5), " ").

-spec decode(string()) -> string().
decode(Str) ->
    convert(Str).

-spec convert(string()) -> string().
convert(Str) ->
    lists:filtermap(fun convert_char/1, Str).

-spec convert_char(char()) -> boolean() | {true, char()}.
convert_char(C) when C >= $A, C =< $Z ->
    {true, $Z - C + $a};
convert_char(C) when C >= $a, C =< $z ->
    {true, $z - C + $a};
convert_char(C) when C >= $0, C =< $9 ->
    true;
convert_char(_C) ->
    false.

-spec chunk(string(), integer()) -> list(string()).
chunk("", _) -> [];
chunk(Str, N) when length(Str) < N ->
    [Str];
chunk(Str, N) ->
    {H, T} = lists:split(N, Str),
    [H | chunk(T,N)].
