require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  describe "initialize" do
    it "exists" do
      carnival = Carnival.new("Festival", 14)
      expect(carnival).to be_a(Carnival)
    end

    it "has attributes" do
      carnival = Carnival.new("Festival", 14)
      expect(carnival.name).to eq("Festival")
      expect(carnival.duration).to eq(14)
      expect(carnival.rides).to eq([])
    end
  end

  describe "#add_ride" do
    it "can add rides" do
      carnival = Carnival.new("Festival", 14)
      # require 'pry'; binding.pry
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      carnival.add_ride(ride1)
      expect(carnival.rides).to eq([ride1])
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      carnival.add_ride(ride2)
      expect(carnival.rides).to eq([ride1, ride2])
    end
  end

  describe "#most_profitable" do
    it "can return the most profitable ride" do
      carnival = Carnival.new("Festival", 14)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })

      carnival.add_ride(ride1)
      carnival.add_ride(ride2)

      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.add_preference(:gentle)
      ride1.board_rider(visitor1)
      expect(carnival.most_profitable).to eq("Carousel")
    end
  end
end