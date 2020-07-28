require 'pry-byebug'
class Clock
  attr_reader :hour, :minute
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def +(minutes)
    new_hour = hour
    new_minute = minute
    new_minute += minutes % 60
    if new_minute > 60
      new_minute -= 60
      new_hour += 1
    end

    new_hour += minutes / 60
    if new_hour > 23
      new_hour -= 24
    end

    Clock.at(new_hour, new_minute)
  end

  def -(minutes)
    new_minute = minute
    new_hour = hour
    new_minute -= minutes % 60
    if new_minute < 0
      new_minute += 60
      new_hour -= 1
    end

    new_hour -= minutes / 60
    if new_hour < 0
      new_hour += 24
    end

    Clock.at(new_hour, new_minute)
  end

  def to_s
    "#{hour.to_s.rjust(2, '0')}:#{minute.to_s.rjust(2, '0')}"
  end

  def ==(other_clock)
    hour == other_clock.hour &&
    minute == other_clock.minute
  end
end


time = Clock.at(7, 30)
time += 13
puts time