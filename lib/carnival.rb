class Carnival
  attr_reader :name,
              :duration,
              :rides

  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_profitable

    most_profitable = @rides[0]
    revenue = 0

    @rides.each do |ride|
      if ride.total_revenue > revenue
        revenue = ride.total_revenue
        most_profitable = ride
      end
    end
    most_profitable.name
  end
end