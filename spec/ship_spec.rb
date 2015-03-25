require 'ship'

describe Ship do
  let(:ship){ Ship.new({size: 2})}
  it "can have a size" do
    expect(ship.size).to eq 2
  end

  it "can be hit" do
    ship.hit
    expect(ship.hits).to eq 1
  end
end
