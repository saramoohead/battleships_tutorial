class Game
  attr_accessor :player_1, :player_2, :turn

  def initialize player_1, player_2
    @player_1, @player_2, @turn = player_1, player_2, player_1
  end

  def make_move position
    # fail 'Game over' if over?
    switch_turn
  end

  def opponent
    turn == player_1 ? player_2 : player_1
  end

  private

  def switch_turn
    @turn = opponent # @turn == player_1 ? @turn = player_2 : @turn = player_1
  end

  # def over?
  #   true
  # end
end
