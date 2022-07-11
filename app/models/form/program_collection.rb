class Form::ScheduleCollection < Form::Base
  FORM_COUNT = 30
  attr_accessor :schedules 

  def initialize(attributes = {})
    super attributes
    self.schedules = FORM_COUNT.times.map { Schedule.new() } unless self.schedules.present?
  end

  def schedules_attributes=(attributes)
    self.schedules = attributes.map { |_, v| Schedule.new(v) }
  end

  def save
    Schedule.transaction do
      self.schedules.map do |schedule|
        if schedule.date != ""
          schedule.save
        end
      end
    end
      return true
    rescue => e
      return false
  end
end