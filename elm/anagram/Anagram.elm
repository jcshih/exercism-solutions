module Anagram (..) where

import String


detect : String -> List String -> List String
detect word candidates =
  let
    w =
      String.toLower word

    sig =
      signature word
  in
    List.filter (\c -> signature c == sig && String.toLower c /= w) candidates


signature : String -> String
signature w =
  w |> String.toLower |> String.toList |> List.sort |> String.fromList
