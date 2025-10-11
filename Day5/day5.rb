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

    def initialize(points, max_x, max_y)
      @max_x = max_x
      @max_y = max_y

      @stored_points = {}
      add_empty_points
      add_points(points)
    end

    def add_empty_points
      (0..@max_x).each do |x|
        (0..@max_y).each do |y|
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

    def number_of_overlap
      @stored_points.map { |_, point| point.count }.count { |count| count > 1 }
    end
  end

  def read_from_file
    points = []
    max_x = 0
    max_y = 0
    File.open('input.txt').each do |line|
      x1y1, x2y2 = line.split(' -> ')
      x1, y1 = x1y1.split(',').map(&:to_i)
      x2, y2 = x2y2.split(',').map(&:to_i)

      max_x = get_max_from_x(x1, x2, max_x)
      max_y = get_max_from_x(y1, y2, max_y)
      points << to_points(x1, y1, x2, y2) if x1 == x2 || y1 == y2
    end
    grid = Day5::Grid.new(points.flatten, max_x, max_y)
    puts grid
    puts 'number of overlap:'
    puts grid.number_of_overlap
  end

  def get_max_from_x(x1, x2, max_x)
    if x1 > max_x
      max_x = x1
    elsif x2 > max_x
      max_x = x2
    end
    max_x
  end

  def get_max_from_y(y1, y2, max_y)
    if y1 > max_y
      max_y = y1
    elsif y2 > max_y
      max_y = y2
    end
    max_y
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
