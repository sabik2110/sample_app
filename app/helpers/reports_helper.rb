module ReportsHelper

  def get_daily_totals(records)
    total_self_development = 0
    total_working_time = 0
    total_extra_time = 0
    total_team_time = 0

    records.each do |record|
      if record.activity.name == "Self Development"
        total_self_development += record.reported_minutes
      elsif record.activity.name == "Working Time"
        total_working_time += record.reported_minutes
      elsif record.activity.name == "Extra Time"
        total_extra_time += record.reported_minutes
      elsif record.activity.name == "Team Time"
        total_team_time += record.reported_minutes
      end
    end

    totals = Hash.new
    totals["total_self_development"] = total_self_development
    totals["total_working_time"] = total_working_time
    totals["total_extra_time"] = total_extra_time
    totals["total_team_time"] = total_team_time

    return totals
  end

  def get_monthly_records_by_day(records)

    calendar_date = Date.parse(session[:calendar_date])
    records_by_day = Hash.new

    (calendar_date.at_beginning_of_month..calendar_date.at_end_of_month).each do |day|

      inside_hash = Hash.new
      self_development = Array.new
      working_time = Array.new
      extra_time = Array.new
      team_time = Array.new

      records.each do |record|
        if record.added_time == day

          if record.activity.name == "Self Development"
            self_development.push record
          elsif record.activity.name == "Working Time"
            working_time.push record
          elsif record.activity.name == "Extra Time"
            extra_time.push record
          elsif record.activity.name == "Team Time"
            team_time.push record
          end

          if self_development.any?
            inside_hash.store('self development', self_development)
          end

          if working_time.any?
            inside_hash.store('working time', working_time)
          end

          if extra_time.any?
            inside_hash.store('extra time', extra_time)
          end

          if team_time.any?
            inside_hash.store('team time', team_time)
          end

        end
      end

      if inside_hash.any?
        records_by_day.store(day, inside_hash)
      end
    end

    return records_by_day
  end

end
