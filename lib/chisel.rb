require 'pry'


class Chisel
  attr_reader :input_file
              :output_file
              :translation
  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @translation = {"1" => "<h1/>", "2" => "<h2/>", :"3" => "<h3/>", "4" => "<h4/>", "5" => "<h5/>", "6" => "<h6/>"}
  end

  def read
    @contents = File.open(@input_file, 'r') { |text| text.read
    }
  end

  def read_lines
    @lines_array = File.open(@input_file).readlines
  end

  def count_hashtags
    @hash_counts = Array.new
    read_lines.map do |each|
      @hash_counts << each.count("!\#")
    end
    return @hash_counts
  end

  def replace_hashtags
    count_hashtags.map! do |each|

    end
  end

  # def replace_hashtags
  #
  #   read_lines.map! do |each|
  #     translate_key = each.count("!\#")
  #     if translate_key != 0
  #       hashes = "\#" * translate_key
  #       each.delete(hashes)
  #       insertion = "#{translate(translate_key)}"
  #       p each.insert(0, "#{insertion}")
  #       # binding.pry
  #     end
  #   end
  # end



  def write
    File.open(@output_file, 'w') {|text|
      text.puts @contents
    }
  end

end

chisel = Chisel.new('./lib/my_input.markdown', './lib/my_output.html')


p chisel.read_lines
p chisel.input_file
p chisel.read_lines
p chisel.count_hashtags

# @translation["#{}"]

# chisel.append('./lib/my_output.html', './lib/my_input.markdown')
# open('./lib/my_output.html', 'a') {|addition|
#   addition.puts "more stuff"
# }
