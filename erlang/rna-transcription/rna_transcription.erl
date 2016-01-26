-module(rna_transcription).
-export([to_rna/1]).

-spec to_rna(string()) -> string().
to_rna(D) ->
    lists:map(fun to_rna_single/1, D).

-spec to_rna_single(char()) -> char().
to_rna_single($G) -> $C;
to_rna_single($C) -> $G;
to_rna_single($T) -> $A;
to_rna_single($A) -> $U.
