class Ship
  attr_reader :size
  DEFAULT_SHIP_SIZE = 1

  def initialize(options)
    @size = options.fetch(:size, 1)
    @hits = 0
  end

  def hit
    @hits += 1
    true
  end

  def sunk?
    @hits >= @size
  end

  def self.battleship
    new(size: 4)
  end

  private

  attr_reader :hits
end
