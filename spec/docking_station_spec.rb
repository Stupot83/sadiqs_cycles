require "docking_station"

describe DockingStation do
  let(:bike) { Bike.new }
  let(:subject) { DockingStation.new }

  it "successfully instantiates the DockingStation class" do
    expect(subject).to be_instance_of(DockingStation)
  end

  it { is_expected.to respond_to :release_bike }

  it "releases a working bike" do
    subject.dock_bike(bike)
    subject.release_bike(bike)
    expect(bike).to be_instance_of(Bike)
    expect(bike).not_to be_damaged
  end

  it { is_expected.to respond_to :dock_bike }

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it "allows a bike to be docked" do
    subject.dock_bike(bike)
    expect(subject.bikes).to include(bike)
  end

  it "should raise error if the dock is empty" do
    expect { subject.release_bike(bike) }.to raise_error("The dock is empty")
  end

  it "should know when it is empty" do
    expect(subject.bikes.empty?).to eq true
  end

  it "should know when it is not empty" do
    subject.dock_bike(bike)
    expect(subject.bikes.empty?).to eq false
  end

  it "has a default capacity of 20" do
    test_capacity = rand(1..100)
    testing_docking_station = DockingStation.new(test_capacity)
    expect(testing_docking_station.capacity).to eq (test_capacity)
  end

  it "only allows up to the default capacity of bikes to be docked if capacity not specified" do
    (subject.capacity).times { subject.bikes << bike }
    expect { subject.dock_bike(bike) }.to raise_error("The dock is full")
  end

  it "should return a list of available undamaged bikes" do
    bike.damage
    subject.dock_bike(bike)
    expect(subject.select_working_bikes).not_to include(bike)
  end

  it "should return a list of damaged bikes in need of repair" do
    bike.damage
    subject.dock_bike(bike)
    expect(subject.bikes).to include(bike)
  end
end
