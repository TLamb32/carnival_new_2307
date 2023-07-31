require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do 
  describe "#initialize" do
    it "exists and has readable attributes" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

      expect(ride1.name).to eq("Carousel")
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
      expect(ride1.total_revenue).to eq(0)
    end
  end

  describe "#board_rider" do
    it "has a rider log (hash) and can add riders to the log if they meet the rquirements" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      expect(ride1.rider_log).to eq({})
    end

    it "can add riders to the log if it meets their preference" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      
      expect(ride1.board_rider(visitor1)).to eq(true)
    end

    it "can add riders if they are tall enough" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')

      expect(ride1.board_rider(visitor1)).to eq(true)
      expect(ride1.board_rider(visitor2)).to eq(true)
    end

    it "can add riders to the rider_log" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.add_preference(:gentle)
      ride1.board_rider(visitor1)
      expect(ride1.rider_log[visitor1.name]).to eq(visitor1)
    end

    it "can add revenue when someone rides a ride and reduce that persons cash spending money" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor1.add_preference(:gentle)
      ride1.board_rider(visitor1)
      expect(ride1.total_revenue).to eq(1)
      expect(visitor1.spending_money).to eq(9)
    end

    it "can add multiple riders" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)

      expect(ride1.rider_log).to include(visitor1.name, visitor2.name)
      expect(ride1.rider_log.keys.count).to eq(2)
    end
  end
end


# it "can add riders to the log if it meets their preference" do
#   ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
#   visitor1 = Visitor.new('Bruce', 54, '$10')
#   visitor2 = Visitor.new('Tucker', 36, '$5')
  
#   visitor1.add_preference(:gentle)
#   visitor2.add_preference(:gentle)

#   expect(ride1.board_rider(visitor1)).to eq(true)
#   expect(ride1.board_rider(visitor2)).to eq(true)
#   expect(ride1.board_rider(visitor1)).to eq(true)

#   expect(ride1.rider_log).to eq()