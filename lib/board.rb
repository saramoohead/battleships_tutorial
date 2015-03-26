class Board
  DEFAULT_SIZE = 1
  attr_reader :grid

  def initialize options
    size = options.fetch(:size, DEFAULT_SIZE)
    cell = options.fetch(:cell)
    @grid = {}
    letter_range_based_on_size(size).map do |letter|
      (1..dimension_size(size)).map{ |number| @grid["#{ letter }#{ number }".to_sym] = cell.new }
    end
  end

  def dimension_size size
    Math.sqrt(size).ceil
  end

  def letter_range_based_on_size size
    ('A'..to_letter_in_alphabet(dimension_size(size)))
  end

  def to_letter_in_alphabet number
    (number.ord + 64).chr
  end

  def place(ship, coord, orientation = :hor)
    fail 'Ship out of bounds' unless all_ship_coords_on_board
    coords_for(ship.size, coord, orientation).each do |coord|
      grid[coord].content = ship
    end
  end

  def coords_for size, coord, orientation
    coords = [coord]
    (size - 1).times { coords << next_coord(coords.last, orientation) }
    coords
  end

  def next_coord coord, orientation
    orientation == :hor ? coord.next : coord.to_s.reverse.next.reverse.to_sym
  end

  def all_ship_coords_on_board size, coord, orientation
    coords_for(ship.size, coord, orientation).all? { |coord| coord_on_board? coord }
  end

  def coord_on_board? coord
    grid.keys.include? coord
  end

  def hit cell
    fail 'Hit out of bounds' unless coord_on_board? cell
    grid[cell].content.hit
  end

  def all_ships_sunk?
    ships.all?(&:sunk?)
  end

  def ships
    grid.values.map(&:content).select{|content| content.respond_to? :sunk? }
  end
end
