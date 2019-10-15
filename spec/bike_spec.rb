require "bike"

describe Bike do
  let(:bike) { Bike.new }

  it "instantiates an instance of the Bike class" do
    expect(bike).to be_instance_of(Bike)
  end

  it { is_expected.to respond_to(:damaged?) }

  it "a new bike is working from creation" do
    expect(bike.damaged?).to eq false
  end

  it "should be able to be damaged" do
    bike.damage
    expect(bike).to be_damaged
  end

  it "should be repairable when damaged" do
    bike.damage
    bike.repair
    expect(bike).not_to be_damaged
  end
end
