module Year
  VERSION = 1

  module_function

  def leap?(year)
    year % 4 == 0 && year % 100 != 0 || year % 400 == 0
  end
end
