require 'board'

describe 'Board' do

  let(:cell){ double :first_cell }
  let(:second_cell){ double :second_cell }
  let(:cell_class) { double :cell_class, new: cell }
  let(:board) { Board.new({ size: 100, cell: cell_class })}
  let(:ship) { double :ship, size: 1 }
  let(:ship) { double :ship, size: 1 }


  it 'has 100 cells in the grid' do
    expect(board.grid.count).to eq 100
  end

  it 'can place a ship' do
    board.grid[:A1] = second_cell
    expect(second_cell).to receive(:content=).with ship
    board.place ship, :A1
  end

  it 'can place a size 2 ship on the grid' do
    board.grid[:A1] = second_cell
    board.grid[:A2] = second_cell
    ship = double :ship, size: 2
    expect(second_cell).to receive(:content=).with(ship).exactly(2).times
    board.place ship, :A1
  end

  it 'can work out the coordinates for a size' do
    expect(board.coords_for(2, :A1)).to eq [:A1, :A2]
  end
end
