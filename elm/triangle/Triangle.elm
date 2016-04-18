module Triangle (..) where

import Set


triangleKind : Float -> Float -> Float -> Result String String
triangleKind a b c =
  if a <= 0 || b <= 0 || c <= 0 then
    Err "Invalid lengths"
  else if a + b <= c || b + c <= a || a + c <= b then
    Err "Violates inequality"
  else
    case Set.size (Set.fromList [a, b, c]) of
      1 ->
        Ok "equilateral"

      2 ->
        Ok "isosceles"

      _ ->
        Ok "scalene"
