class Ship
  attr_reader :size, :hits
  DEFAULT_SHIP_SIZE = 1

  def initialize(options)
    @size = options.fetch(:size, 1)
    @hits = 0
  end

  def hit
    @hits += 1
  end
end
