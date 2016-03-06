-module(dna).
-export([count/2, nucleotide_counts/1]).

-spec count(string(), string()) -> non_neg_integer().
count(Strand, [Nuc]) ->
    validate(Nuc),
    count(Strand, Nuc, 0).

count("", _, Count) -> Count;
count([H|T], Nuc, Count) ->
    case H =:= Nuc of
        true -> count(T, Nuc, Count+1);
        _ -> count(T, Nuc, Count)
    end.

validate(Nuc) ->
    case lists:member(Nuc, "ACGT") of
        true -> true;
        _ -> erlang:error("Invalid nucleotide")
    end.

-spec nucleotide_counts(string()) -> list(tuple()).
nucleotide_counts(Strand) ->
    [{"A", count(Strand, "A")},
     {"T", count(Strand, "T")},
     {"C", count(Strand, "C")},
     {"G", count(Strand, "G")}].
