module DifferenceOfSquares (..) where

import List exposing (sum, foldl)


squareOfSum : Int -> Int
squareOfSum n =
  let
    sumToN =
      sum [1..n]
  in
    sumToN * sumToN


sumOfSquares : Int -> Int
sumOfSquares n =
  foldl (\x acc -> x * x + acc) 0 [1..n]


difference : Int -> Int
difference n =
  squareOfSum n - sumOfSquares n
