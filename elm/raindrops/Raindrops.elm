module Raindrops (raindrops) where

import List


data : List (Int, String)
data =
  [(3, "Pling"), (5, "Plang"), (7, "Plong")]


raindrops : Int -> String
raindrops n =
  let
    str = List.foldl (buildOutput n) "" data
  in
    case str of
      "" ->
        toString n
      _ ->
        str


buildOutput : Int -> (Int, String) -> String -> String
buildOutput n (factor, str) acc =
  case n % factor == 0 of
    True ->
      acc ++ str
    False ->
      acc
