# == Schema Information
#
# Table name: appointments
#
#  id          :integer          not null, primary key
#  description :text             not null
#  date        :date             not null
#  start_time  :time             not null
#  end_time    :time             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Appointment < ActiveRecord::Base
  composed_of :timeslot, mapping: [["start_time", "start_time"], ["end_time", "end_time"]]
end
