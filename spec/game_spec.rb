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

  it 'knows whose turn it is'
    
  end
end
