# Day 2 implementation
module Day2
  SubMarineInstruction = Data.define(:instruction, :number)

  # SubMarine that can to up, down, or forward
  class SubMarine
    def initialize
      @horizontal_position = 0
      @depth = 0
    end

    def forward(number: Numeric)
      @horizontal_position += number
    end

    def down(number: Numeric)
      @depth -= number
    end

    def up(number: Numeric)
      @depth += number
    end

    def position
      @horizontal_position * @depth
    end

    def to_s
      "#{@horizontal_position} - #{@depth}"
    end
  end

  def read_from_file
    array = []
    File.foreach('input.txt') { |line| array << SubMarineInstruction.new(line.to_s.split) }
    array
  end

  def day2_first_part(array)
    submarine = SubMarine.new
    array.each do |element|
      instruction, number = element.values_at(:instruction, :number)
      submarine.public_send(instruction, *number)
    end
    submarine.position
  end
end

array = Program.read_from_file
puts Program.day1_first_part(array)
