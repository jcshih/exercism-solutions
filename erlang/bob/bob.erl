-module(bob).
-export([response_for/1]).

-define(Responses, 
        [
         {fun is_blank/1, "Fine. Be that way!"},
         {fun is_exclamation/1, "Whoa, chill out!"},
         {fun is_question/1, "Sure."},
         {fun (_) -> true end, "Whatever."}
        ]).

-spec response_for(string()) -> string().
response_for(S) ->
    response_for(S, ?Responses).

response_for(S, [{F,R}|Fs]) ->
    case F(S) of
        true -> R;
        false -> response_for(S, Fs)
    end.

is_blank(S) ->
    string:strip(S) =:= "".

is_exclamation(S) ->
    string:to_upper(S) =:= S andalso string:to_lower(S) =/= S.

is_question(S) ->
    lists:last(S) =:= $?.
