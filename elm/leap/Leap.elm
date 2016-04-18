module Leap (..) where


isLeapYear : Int -> Bool
isLeapYear year =
  year % 400 == 0 || year % 100 /= 0 && year % 4 == 0
