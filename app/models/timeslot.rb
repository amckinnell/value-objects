class Timeslot
  include Comparable

  include ActiveModel::Validations

  attr_reader :start_time, :end_time

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :valid_interval

  def initialize(start_time, end_time)
    @start_time = start_time
    @end_time = end_time
  end

  def <=>(other)
    start_comparison = self.start_time <=> other.start_time

    start_comparison.zero? ? (self.end_time <=> other.end_time) : start_comparison
  end

  def valid_interval
    return unless start_time.present? && end_time.present?

    unless start_time < end_time
      errors.add(:start_time, "must be prior to end time")
    end
  end
end
