# == Schema Information
#
# Table name: appointments
#
#  id          :integer          not null, primary key
#  description :text             not null
#  date        :date             not null
#  start       :time             not null
#  end         :time             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Appointment < ActiveRecord::Base
end
