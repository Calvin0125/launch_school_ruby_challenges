class Robot
  attr_reader :bearing, :coordinates
  def initialize
    @bearing = nil
    @coordinates = []
  end

  def orient(direction)
    raise(ArgumentError) unless %i(north south east west).include?(direction)
    @bearing = direction
  end

  def turn_right
    case bearing
    when nil
      return
    when :east
      self.orient(:south)
    when :south
      self.orient(:west)
    when :west
      self.orient(:north)
    when :north
      self.orient(:east)
    end
  end

  def turn_left
    case bearing
    when nil
      return
    when :east
      self.orient(:north)
    when :south
      self.orient(:east)
    when :west
      self.orient(:south)
    when :north
      self.orient(:west)
    end
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    case bearing
    when nil
      return
    when :north
      @coordinates[1] += 1
    when :east
      @coordinates[0] += 1
    when :south
      @coordinates[1] -= 1
    when :west
      @coordinates[0] -= 1
    end
  end
end

class Simulator
  def instructions(string)
    commands = []
    string.chars.each do |command|
      case command
      when 'L'
        commands << :turn_left
      when 'R'
        commands << :turn_right
      when 'A'
        commands << :advance
      end
    end
    commands
  end

  def place(robot, x:, y:, direction:)
    robot.orient(direction)
    robot.at(x, y)
  end

  def evaluate(robot, instructions)
    commands = instructions(instructions)
    commands.each do |command|
      case command
      when :turn_left
        robot.turn_left
      when :turn_right
        robot.turn_right
      when :advance
        robot.advance
      end
    end
  end
end