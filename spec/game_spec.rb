require 'game'

describe Game do
  let(:game) { Game.new(player_1, player_2) }
  let(:player_1) { double :player_1 }
  let(:player_2) { double :player_2 }

  it 'knows who player_1 is' do
    expect(game.player_1).to eq player_1
  end

  it 'knows who player_2 is' do
    expect(game.player_2).to eq player_2
  end

  it 'knows whose turn it is' do
    expect(game.turn).to eq player_1
  end

  it 'switches turns after each move' do
    game.make_move #:A1
    expect(game.turn).to eq player_2
  end

  it 'doesn\'t switch turns if game is over' do
    expect(game).to receive(:over?).and_return true
    expect { game.make_move }.to raise_error 'Game over'
  end

  it 'passes the shot to the opponent' do

  end
end
