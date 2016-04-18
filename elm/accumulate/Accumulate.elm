module Accumulate (..) where


accumulate : (a -> b) -> List a -> List b
accumulate f xs =
  case xs of
    (x :: xs') ->
      f x :: accumulate f xs'

    _ ->
      []
