module Pangram where

import String


alphabet : String
alphabet =
  "abcdefghijklmnopqrstuvwxyz"


isPangram : String -> Bool
isPangram str =
  let
    s = String.toLower str
  in
    String.all (\c -> String.contains (String.fromChar c) s) alphabet
