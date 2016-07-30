# Grade School Challenge

class School

  def initialize
    @student_roster = Hash.new { |roster, grade| roster[grade] = [] }
  end

  def to_h
    @student_roster.sort.map { |_, list_of_students| [_, list_of_students.sort] }.to_h
  end

  def add(name, grade)
    @student_roster[grade] << name
  end

  def grade(number)
    @student_roster[number]
  end
end
