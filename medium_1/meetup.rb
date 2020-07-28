require 'date'

class Meetup
  def initialize(month, year)
    @date = Date.new(year, month, -1)
    @schedule_key = {
      first: (1..7),
      second: (8..14),
      third: (15..21),
      fourth: (22..28),
      last: ((@date.day - 6)..@date.day),
      teenth: (13..19)
    }
  end

  WDAY_NUMBERS = {
    sunday: 0,
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6
  }

  def day(day, schedule)
    date = @date
    until date.wday == WDAY_NUMBERS[day] && @schedule_key[schedule].include?(date.day)
      date = date.prev_day
    end
    date
  end
end
