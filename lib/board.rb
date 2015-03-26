class Board
  DEFAULT_SIZE = 1
  DEFAULT_NUMBER_OF_PIECES = 1
  attr_reader :grid, :number_of_pieces

  def initialize options
    size = options.fetch(:size, DEFAULT_SIZE)
    cell = options.fetch(:cell)
    @number_of_pieces = options.fetch(:number_of_pieces, DEFAULT_NUMBER_OF_PIECES)
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
    fail 'Ship out of bounds' unless coords_for(ship.size, coord, orientation).all? { |coord| coord_on_board? coord }
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

  def coord_on_board? coord
    grid.keys.include? coord
  end
  
  def fill_all_content_with something
    grid.each do |cell|
      cell.content = something
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

  def ready?
    ships.count == number_of_pieces
  end
  
  def lost?
    all_ships_sunk? && ready?
  end
end
