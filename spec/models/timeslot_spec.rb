require 'rails_helper'

RSpec.describe Timeslot, type: :model do
  describe ".validates" do
    it "valid" do
      subject = Timeslot.new(
        Time.zone.parse("2016-12-03 10:00:00"),
        Time.zone.parse("2016-12-03 10:30:00")
      )

      expect(subject).to be_valid
    end

    it "invalid start time" do
      subject = Timeslot.new(
        nil,
        Time.zone.parse("2016-12-03 10:30:00")
      )

      expect(subject).to be_invalid
    end

    it "invalid end time" do
      subject = Timeslot.new(
        Time.zone.parse("2016-12-03 10:00:00"),
        nil
      )

      expect(subject).to be_invalid
    end

    it "invalid time slot" do
      subject = Timeslot.new(
        Time.zone.parse("2016-12-03 10:30:00"),
        Time.zone.parse("2016-12-03 10:00:00")
      )

      expect(subject).to be_invalid
    end
  end
end
