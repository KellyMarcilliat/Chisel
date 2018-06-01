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

  def test_it_creates_array_of_parsed_lines_from_input_file
    chisel = Chisel.new('./lib/input_for_test.markdown', './lib/output_for_test.html')
    assert_equal ["totally interesting stuff\n",  "i want to see more!\n", "\n", "1. sonoran dessert\n", "2. chihuahuan dessert\n"], chisel.read_lines('./lib/input_for_test.markdown')
  end

  def test_write_adds_text_to_file
    chisel = Chisel.new('./lib/input_for_test.markdown', './lib/output_for_test.html')
      chisel.read_lines('./lib/input_for_test.markdown')
      chisel.write('./lib/output_for_test.html')

    assert_equal ["totally interesting stuff\n",  "i want to see more!\n", "\n", "1. sonoran dessert\n", "2. chihuahuan dessert\n"], chisel.read_lines('./lib/output_for_test.html')
  end

end
