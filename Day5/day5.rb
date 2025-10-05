# Day 5 implementation
module Day5
  module_function

  # Point object with counter
  class Point
    def initialize(x, y)
      @x = x
      @y = y
      @count = 0
    end

    def to_s
      "#{@x},#{@y}"
    end

    def increment_counter
      @count += 1
    end
  end

  # Grid of points value with min and max coordinates
  class Grid
    def initialize(points)
      @stored_points = {}
      points.each do |point|
        if @stored_points.key?(point.to_s)
          @stored_points[point.to_s].increment_counter
        else
          @stored_points[point.to_s] = point
        end
      end
    end

    def to_s
      @stored_points.sort_by { |x, y| [x, y] }.each(&:to_s).join("\n")
    end
  end

  def read_from_file
    points_to_cover = []
    File.open('input.txt').each do |line|
      x1y1, x2y2 = line.split(' -> ')
      x1, y1 = x1y1.split(',') # 0,9
      x2, y2 = x2y2.split(',') # 5,9
      points_to_cover << to_points(x1, y1, x2, y2)
    end
    puts Day5::Grid.new(points_to_cover)
  end

  def to_points(x1, y1, x2, y2)
    points = []
    min_x, max_x = [x1, x2].minmax
    min_y, max_y = [y1, y2].minmax
    (min_x..max_x).each do |x|
      (min_y..max_y).each do |y|
        points << Day5::Point.new(x, y)
      end
    end
    points
  end
end

Day5.read_from_file
