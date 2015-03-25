class Board
  DEFAULT_SIZE = 1
  DEFAULT_CONTENT = String

  attr_reader :grid

  def initialize options
    size = options.fetch(:size, DEFAULT_SIZE)
    cell = options.fetch(:cell, DEFAULT_CONTENT)
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
end
