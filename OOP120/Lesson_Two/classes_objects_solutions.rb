class Person

  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name 
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    parts_of_name = full_name.split
    self.first_name = parts_of_name.first
    self.last_name = parts_of_name.size > 1 ? parts_of_name.last : ''
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
puts bob.name == rob.name
puts "The person's name is: #{bob}"
