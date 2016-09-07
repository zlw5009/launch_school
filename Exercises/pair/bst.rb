class Bst
  attr_accessor :data, :left, :right
  
  def initialize(data)
    @data = data
  end

  def insert(number)
    if number <= data
      left ? left.insert(number) : self.left = Bst.new(number)
    elsif number > data
      right ? right.insert(number) : self.right = Bst.new(number)
    end    
  end

  def each(&block)
    if block_given?
      left.each(&block) if left
      yield(@data)
      right.each(&block) if right
    else
      return to_enum(:each)
    end
  end
end

  four = Bst.new 4
    four.insert 2
    four.insert 6
    four.insert 1
    four.insert 3
    four.insert 7
    four.insert 5
