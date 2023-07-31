class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log

  def initialize(ride_data)
    @name = ride_data[:name]
    @min_height = ride_data[:min_height]
    @admission_fee = ride_data[:admission_fee]
    @excitement = ride_data[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end

  def board_rider(rider)
    if !rider.tall_enough?(@min_height)
      false
    elsif rider.spending_money.to_i < @admission_fee
      true
    elsif !rider.preferences.include?(@excitement)
      true

    else
      @rider_log[rider.name] = rider
      @total_revenue += @admission_fee
      rider.spend(@admission_fee)
      @rider_log
    end
  end
end