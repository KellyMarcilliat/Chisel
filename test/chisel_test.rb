require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/chisel'

class ChiselTest < Minitest::Test
  def test_instance_of_chisel_exists
    chisel = Chisel.new('./lib/input_for_test.markdown', './lib/output_for_test.html')

    assert_instance_of Chisel, chisel
  end

  def test_read_generates_array_holding_strings_of_text_from_target_file
    chisel = Chisel.new('./lib/input_for_test.markdown', './lib/output_for_test.html')

    assert_equal ["totally interesting stuff\n",  "i want to see more!\n"],chisel.read_lines
  end

  def test_write_adds_text_to_file
    chisel = Chisel.new('./lib/input_for_test.markdown', './lib/output_for_test.html')
      chisel.read_lines
      chisel.write

    assert_equal ["totally interesting stuff\n",  "i want to see more!\n"], chisel.read_lines
  end



  # def test_append_appends_text_to_target_file
  #   chisel = Chisel.new
  #
  #   assert_equal "totally interesting stuff"

end
