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
end
