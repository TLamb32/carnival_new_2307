require './lib/visitor'

RSpec.describe Visitor do
  describe "#initialize" do
    it "exists and has readable attributes" do
      visitor1 = Visitor.new('Bruce', 54, '$10')

      expect(visitor1.name).to eq("Bruce")
      expect(visitor1.height).to eq(54)
      expect(visitor1.spending_money).to eq(10)
      expect(visitor1.preferences).to eq([])
    end
  end

  describe "#add_preferences" do
    it "can add preferences to the array" do
      visitor1 = Visitor.new('Bruce', 54, '$10')
      expect(visitor1.preferences).to eq([])

      visitor1.add_preference(:gentle)
      visitor1.add_preference(:thrilling)

      expect(visitor1.preferences).to eq([:gentle, :thrilling])

    end
  end
end