class Methods
  attr_accessor :link

  def initialize
    @link = ''
  end

  def this_method
    p "Yo yo"
  end
  alias_method :and_this, :this_method

  def display
    p link.this_method
  end
end

list = Methods.new

list.ancestors


