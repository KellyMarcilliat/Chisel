require 'pry'


class Chisel
  attr_reader :input_file
              :output_file
  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def read_lines
    @lines_array = File.open(@input_file).readlines
  end

  def write
    File.open(@output_file, 'w') {|text|
      text.puts @lines_array
    }
  end


end

chisel = Chisel.new('./lib/my_input.markdown', './lib/my_output.html')


chisel.read_lines
# p chisel.paragraph_tagging
# p chisel.count_hashtags
# p chisel.find_prepend_tag
# p chisel.find_append_tag
# p chisel.remove_hashtags
# p chisel.remove_leading_space
# p chisel.add_html_tags
chisel.write

# @hash_sub_opening["#{}"]
