class Timeslot
  include Comparable

  attr_reader :start_time, :end_time

  def initialize(start_time, end_time)
    @start_time = start_time
    @end_time = end_time
  end

  def <=>(other)
    start_comparison = self.start_time <=> other.start_time

    start_comparison.zero? ? (self.end_time <=> other.end_time) : start_comparison
  end
end
