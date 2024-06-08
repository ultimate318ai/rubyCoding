module Program

  module_function

  def read_from_file
    array = []
    File.foreach("input.txt") { |line| array << line.to_i }
    return array
  end

  def day1(array)
    last_element = -1
    counter = 0
    array.each do |element|
      unless last_element == -1
        if last_element < element
          counter = counter + 1
        end
      end
      last_element = element
    end
    return counter
  end
end

array = Program::read_from_file
puts Program::day1(array)
