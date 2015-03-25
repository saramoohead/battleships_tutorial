require 'board'

describe 'Board' do
  let(:board) { Board.new({size: 100})}

  it 'has 100 cells in the grid' do
    expect(board.grid.count).to eq 100
  end
end
