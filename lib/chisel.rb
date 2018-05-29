require 'pry'


class Chisel
  attr_reader :input_file
              :output_file
              :translation
  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
    @translation = {"0" => "", "1" => "<h1/>", "2" => "<h2/>", :"3" => "<h3/>", "4" => "<h4/>", "5" => "<h5/>", "6" => "<h6/>"}
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

  def find_tags
    @replacement_tag = []
    count_hashtags.map do |each|
      @replacement_tag << @translation[each.to_s]
    end
    return @replacement_tag
  end

  def remove_hashtags
    @no_hashtags = read_lines.map! do |each|
      hashes = "\#" * each.count("!\#")
      each.delete(hashes)
    end
  end

  def remove_leading_space
    remove_hashtags.map! do |each|
      if each != "\n"
        each.lstrip
      else
        each
      end
    end
  end

  def append_html_tag
    count = -1
    remove_leading_space.map! do |each|
      count += 1
      each.prepend(@replacement_tag[count])
    end
    # return
  end

  def write
    File.open(@output_file, 'w') {|text|
      text.puts @contents
    }
  end

end

chisel = Chisel.new('./lib/my_input.markdown', './lib/my_output.html')


p chisel.read_lines
p chisel.count_hashtags
p chisel.find_tags
p chisel.remove_hashtags
p chisel.remove_leading_space
p chisel.append_html_tag

# @translation["#{}"]

# chisel.append('./lib/my_output.html', './lib/my_input.markdown')
# open('./lib/my_output.html', 'a') {|addition|
#   addition.puts "more stuff"
# }
