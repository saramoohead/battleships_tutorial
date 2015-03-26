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

  it 'knows it has a board' do
    player.board = board
    expect(player).to have_board
  end
end
