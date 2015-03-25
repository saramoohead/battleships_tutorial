class Board
  DEFAULT_SIZE = 1

  def initialize options
    size = options.fetch(:size, DEFAULT_SIZE)
    @grid = letter_range_based_on_size(size).map do |letter|
      (1..dimension_size(size)).map{ |number| "#{letter}#{number}".to_sym }
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

  def grid
    p @grid
    @grid
  end
end
