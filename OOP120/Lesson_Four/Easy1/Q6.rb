# We can add in attr_reader to have a getter method for :volume.

class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end

big_cube = Cube.new(13)
puts big_cube.volume