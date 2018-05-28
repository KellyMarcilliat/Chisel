require 'pry'


class Chisel
  def initialize
  end

  def read(input_file)
    @contents = open(input_file, 'r'){ |text| text.read }
  end

  def write(output_file)
    open(output_file, 'w') {|text|
      text.puts @contents
    }
  end 

end
