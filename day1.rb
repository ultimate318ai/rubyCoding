module Program

  module_function

  def day1
    array = [199,200,208,210,200,207,240,269,260,263]
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

puts Program::day1
