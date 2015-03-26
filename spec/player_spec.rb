require 'player'

describe Player do
  let(:player) { Player.new 'Bob' }
  let(:board) { double :board }



  it 'can have a name' do
    expect(player.name).to eq 'Bob'
  end

  it 'can have a board' do
    player.board = board
    expect(player.board).to eq board
  end

  context 'player with a board' do

  before { player.board = board }

    it 'knows it has a board' do
      expect(player).to have_board
    end

    it 'knows if the board is ready' do
      expect(player.board).to receive(:ready?)
      player.ready?
    end
  
    it 'knows if they have lost' do
      allow(player.board).to receive(:ready?).and_return true
      expect(player.board).to receive(:lost?)
      player.lost?
    end
  end
end
