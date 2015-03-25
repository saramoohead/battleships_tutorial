require 'board'

describe 'Board' do
  # for all cells in this test, let cell symbol equal double fake object cell
  let(:cell){double :cell}

  # for all cell classes, let cell_class equal a double fake object cell_class which 
  # can receive the method new and gives an local instance of the double cell created above

  let(:cell_class) { double :cell_class, new: cell }
  
  # the cell here is pulled from the bord.rb cell initalized options
  # and we are telling that it will be the double cell_class
  let(:board) { Board.new({size: 100, cell: cell_class })}


  it 'has 100 cells in the grid' do
    expect(board.grid.count).to eq 100
  end
end
