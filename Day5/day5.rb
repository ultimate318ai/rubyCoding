# Day 5 implementation
module Day5
  module_function

  # Point object with counter
  class Point
    attr_reader :x, :y, :count

    def initialize(x, y)
      @x = x
      @y = y
      @count = 0
    end

    def hash
      "#{@x},#{@y}"
    end

    def to_s
      if @count.zero?
        '.'
      else
        @count.to_s
      end
    end

    def increment_counter
      @count += 1
    end
  end

  # Grid of points value with min and max coordinates
  class Grid
    attr_reader :x, :y, :count

    def initialize(points)
      @max_x = points.select(&:x).max_by(&:x).x
      @max_y = points.select(&:y).max_by(&:y).y

      @stored_points = {}
      add_empty_points
      add_points(points)
    end

    def add_empty_points
      (0..@max_x.to_i).each do |x|
        (0..@max_y.to_i).each do |y|
          point = Day5::Point.new(x, y)
          @stored_points[point.hash] = point
        end
      end
    end

    def add_points(points)
      points.each do |point|
        @stored_points[point.hash].increment_counter
      end
    end

    def to_s
      counter = 0
      @stored_points.map do |(coordinates, point)|
        if counter < @max_x
          counter += 1
          next "(#{coordinates}) [#{point}] "
        else
          counter = 0
          next "(#{coordinates}) [#{point}]\n"
        end
      end.join.to_s
    end
  end

  def read_from_file
    points = []
    File.open('input.txt').each do |line|
      x1y1, x2y2 = line.split(' -> ')
      x1, y1 = x1y1.split(',') # 0,9
      x2, y2 = x2y2.split(',') # 5,9
      points << to_points(x1, y1, x2, y2)
    end
    puts Day5::Grid.new(points.flatten)
  end

  def to_points(x1, y1, x2, y2)
    points = []

    min_x, max_x = [x1.to_i, x2.to_i].minmax
    min_y, max_y = [y1.to_i, y2.to_i].minmax
    (min_x..max_x).each do |x|
      (min_y..max_y).each do |y|
        points << Day5::Point.new(x, y)
      end
    end
    points
  end
end

Day5.read_from_file
