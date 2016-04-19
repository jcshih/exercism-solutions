module Strain (..) where


keep : (a -> Bool) -> List a -> List a
keep f list =
  case list of
    [] ->
      []

    head :: tail ->
      if f head then
        head :: keep f tail
      else
        keep f tail


discard : (a -> Bool) -> List a -> List a
discard f list =
  case list of
    [] ->
      []

    head :: tail ->
      if f head then
        discard f tail
      else
        head :: discard f tail
