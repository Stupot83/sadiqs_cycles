require "bike"

describe Bike do
  before :each do
    @new_bike = Bike.new
  end

  it "instantiates an instance of the Bike class" do
    expect(@new_bike).to be_instance_of(Bike)
  end

  it { is_expected.to respond_to(:working?) }

  it "a new bike is working from creation" do
    expect(@new_bike.working?).to eq true
  end
end
