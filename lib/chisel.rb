require 'pry'


class Chisel
  attr_reader :input_file
              :output_file
  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def read
    @contents = open(@input_file, 'r'){ |text| text.read }
  end

  def write
    open(@output_file, 'w') {|text|
      text.puts @contents
    }
  end

end

chisel = Chisel.new('./lib/my_input.markdown', './lib/my_output.html')

chisel.read
chisel.write
# chisel.append('./lib/my_output.html', './lib/my_input.markdown')
# open('./lib/my_output.html', 'a') {|addition|
#   addition.puts "more stuff"
# }
