class Player
  attr_reader :name
  attr_accessor :board

  def initialize name
    @name = name
  end

  def has_board?
    !board.nil?
  end
end
