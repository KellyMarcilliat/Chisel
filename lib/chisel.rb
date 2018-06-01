require 'pry'


class Chisel
  attr_reader :input_file,
              :output_file,
              :lines_array
  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @lines_array = []
  end

  def read_lines(read_file)
    @lines_array = File.open(read_file).readlines
  end

  def write(write_file)
    File.open(write_file, 'w') {|text|
      text.puts @lines_array
    }
    # return @lines_array
  end
  # binding.pry
end

chisel = Chisel.new('./lib/my_input.markdown', './lib/my_output.html')
  chisel.read_lines('./lib/my_input.markdown')
  p chisel.write('./lib/my_output.html')
