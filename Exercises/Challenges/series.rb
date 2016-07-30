class Series

  def initialize(string)
    @numbers = string.chars.map(&:to_i)
  end

  def sliced(x)
    slices = []
    sections = @numbers

    until sections.size <= 1
      slices << sections.slice(0..x-1)
      sections.delete_at(0)
    end

    slices.delete_if { |slice| slice.size < x }
    slices
  end

  def slices(x) 
    raise ArgumentError if x > @numbers.size
    
    x == 1 ? @numbers.permutation(x).to_a : sliced(x)
  end
end