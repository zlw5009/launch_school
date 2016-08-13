module Fulltimeable
  def set_employment_type
    self.employment_type = 'Full-Time'
  end
end

class Employee
  attr_accessor :name, :serial_number, :employment_type

  def initialize(name, serial_number)
    @name = name
    @serial_number = serial_number
    @employment_type = set_employment_type
  end
end

class Manager < Employee
  module Fulltimeable
  MANAGER_VACATION = 14

  attr_accessor :vacation_time
  attr_reader :desk_type, :delegation_authority

  def initialize
    super
    @desk_type = "Regular Private Office"
    @vacation_time = MANAGER_VACATION
    @delegation_authority = 'Permitted'
  end

  def name
    "Mgr " + @name
  end
end

class Executive < Employee
  module Fulltimeable
  EXECUTIVE_VACATION = 20

  attr_accessor :vacation_time
  attr_reader :desk_type, :delegation_authority

  def initialize
    super
    @desk_type = "Corner Office"
    @vacation_time = EXECUTIVE_VACATION
    @delegation_authority = 'Permitted'
  end

  def name
    "Exe " + @name
  end
end

class Regular < Employee
  module Fulltimeable
  REGULAR_VACATION = 10

  def initialize
    super
    @desk_type = "Assigned Cubical"
    @vacation_time = REGULAR_VACATION
    @delegation_authority = 'Denied'
  end
end

class PartTime < Employee
  PART_TIME_VACATION = 0

  def initialize
    super
    @desk_type = "Open Workspace; Not Reserved"
    @vacation_time = PART_TIME_VACATION
    @delegation_authority = 'Denied'
  end

  def set_employment_type
    self.employment_type = 'Part-time'
  end
end

rick = Manager.new('Rick', 444)
p rick.desk_type
p rick.vacation_time
p rick.employment_type
p rick.name