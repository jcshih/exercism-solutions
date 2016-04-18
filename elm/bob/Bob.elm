module Bob where

import String


hey : String -> String
hey str =
  if isSilence str then
    "Fine. Be that way!"
  else if isExclamation str then
    "Whoa, chill out!"
  else if isQuestion str then
    "Sure."
  else
    "Whatever."


isSilence : String -> Bool
isSilence str =
  str |> String.trim |> String.isEmpty


isExclamation : String -> Bool
isExclamation str =
  str == String.toUpper str && str /= String.toLower str


isQuestion : String -> Bool
isQuestion str =
  String.endsWith "?" str
