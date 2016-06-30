# Saddle Points challenge

class Matrix

  def initialize(matrix)
    @rows = matrix.split("\n").map { |rows| rows.split(' ').map(&:to_i) }
    @columns = @rows.transpose
  end

  
end