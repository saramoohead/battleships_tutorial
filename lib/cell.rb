class Cell
  attr_accessor :content

  def initialize
    @hit = false
  end

  def hit
    fail 'Cell already hit.' if hit?
    @hit = content.hit
  end

  def hit?
    @hit
  end
end
