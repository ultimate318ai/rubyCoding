# Day 2 implementation
module Day2
  class SubMarineInstruction < Data.define(:instruction, :number)
  end

  # SubMarine that can to up, down, or forward
  class SubMarinePart1
    def initialize
      @horizontal_position = 0
      @depth = 0
    end

    def forward(number)
      @horizontal_position += number
    end

    def down(number)
      @depth += number
    end

    def up(number)
      @depth -= number
    end

    def position
      @horizontal_position * @depth
    end

    def to_s
      "#{@horizontal_position} - #{@depth}"
    end
  end

  # SubMarine that can to up, down, or forward with aim
  class SubMarinePart2
    def initialize
      @horizontal_position = 0
      @depth = 0
      @aim = 0
    end

    def forward(number)
      @horizontal_position += number
      @depth += @aim * number
    end

    def down(number)
      @aim += number
    end

    def up(number)
      @aim -= number
    end

    def position
      @horizontal_position * @depth
    end

    def to_s
      "#{@horizontal_position} - #{@depth}"
    end
  end

  module_function

  def read_from_file
    array = []
    File.foreach('input.txt') do |line|
      array << line.to_s.split.each_slice(2) do |instruction, number|
        SubMarineInstruction.new(instruction: instruction, number: number)
      end
    end
    array
  end

  def day2_first_part(array)
    submarine = SubMarinePart1.new
    array.each do |element|
      submarine.public_send(element[0], element[1].to_i)
    end
    submarine.position
  end

  def day2_second_part(array)
    submarine = SubMarinePart2.new
    array.each do |element|
      submarine.public_send(element[0], element[1].to_i)
    end
    submarine.position
  end
end

array = Day2.read_from_file
puts Day2.day2_first_part(array)
puts Day2.day2_second_part(array)
