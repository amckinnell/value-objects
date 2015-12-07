require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it "composed of timeslot" do
    appointment = Appointment.create(
      description: "description",
      date: Time.zone.parse("2016-12-03"),
      start_time: Time.zone.parse("2016-12-03 10:00:00"),
      end_time: Time.zone.parse("2016-12-03 10:30:00")
    )

    expected_timeslot = Timeslot.new(Time.zone.parse("2016-12-03 10:00:00"), Time.zone.parse("2016-12-03 10:30:00"))

    expect(appointment.timeslot).to eq(expected_timeslot)
  end

  describe "validations detect" do
    it "blank description" do
      appointment = Appointment.new(
        description: nil,
        date: Time.zone.parse("2016-12-03"),
        start_time: Time.zone.parse("2016-12-03 10:00:00"),
        end_time: Time.zone.parse("2016-12-03 10:30:00")
      )

      expect(appointment).to_not be_valid
      expect(appointment.errors.full_messages.join(",")).to match(
        /Description can't be blank/)
    end

    it "invalid start time" do
      appointment = Appointment.new(
        description: "description",
        date: Time.zone.parse("2016-12-03"),
        start_time: nil,
        end_time: Time.zone.parse("2016-12-03 10:30:00")
      )

      expect(appointment).to_not be_valid
      expect(appointment.errors.full_messages.join(",")).to match(/Start time can't be blank/)
    end

    it "invalid end time" do
      appointment = Appointment.new(
        description: "description",
        date: Time.zone.parse("2016-12-03"),
        start_time: Time.zone.parse("2016-12-03 10:00:00"),
        end_time: nil
      )

      expect(appointment).to_not be_valid
      expect(appointment.errors.full_messages.join(",")).to match(/End time can't be blank/)
    end

    it "invalid interval" do
      appointment = Appointment.new(
        description: "description",
        date: Time.zone.parse("2016-12-03"),
        start_time: Time.zone.parse("2016-12-03 10:30:00"),
        end_time: Time.zone.parse("2016-12-03 10:00:00")
      )

      expect(appointment).to_not be_valid
      expect(appointment.errors.full_messages.join(",")).to match(/Start time must be prior to end time/)
    end
  end
end
