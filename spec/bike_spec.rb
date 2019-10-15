require "bike"

describe Bike do
  before :each do
    @new_bike = Bike.new
  end

  it "instantiates an instance of the Bike class" do
    expect(@new_bike).to be_instance_of(Bike)
  end

  it { is_expected.to respond_to(:damaged?) }

  it "a new bike is working from creation" do
    expect(@new_bike.damaged?).to eq false
  end

  it "should be able to be damaged" do
    @new_bike.damage
    expect(@new_bike).to be_damaged
  end

  it "should be repairable when damaged" do
    @new_bike.damage
    @new_bike.repair
    expect(@new_bike).not_to be_damaged
  end
end
