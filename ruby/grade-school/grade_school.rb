class School
  VERSION = 1

  def initialize
    @students = Hash.new { |h, k| h[k] = [] }
  end

  def grade(grade_number)
    students[grade_number]
  end

  def add(name, grade)
    pos = students[grade].index { |e| name < e } || -1
    students[grade].insert(pos, name)
  end

  def to_h
    Hash[students.sort_by(&:first)]
  end

  private

  attr_accessor :students
end
