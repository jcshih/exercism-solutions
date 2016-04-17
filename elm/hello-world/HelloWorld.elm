module HelloWorld (..) where


helloWorld : Maybe String -> String
helloWorld nameMaybe =
  let
    name = Maybe.withDefault "World" nameMaybe
  in
    "Hello, " ++ name ++ "!"
