module RecordsHelper
  def convert_to_hours_minutes(minutes)
    (minutes.to_i/60).to_s + ":" + (minutes.to_i%60).to_s
  end
end
