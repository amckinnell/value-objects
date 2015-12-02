class TimeslotValidator < ActiveModel::EachValidator
  def validate_each(record, _attribute, timeslot)
    timeslot.validate

    timeslot.errors.each do |timeslot_attribute, error|
      record.errors.add(timeslot_attribute, error)
    end
  end
end
