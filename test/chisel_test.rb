require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/chisel'

class ChiselTest < Minitest::Test
  def test_instance_of_chisel_exists
    chisel = Chisel.new

    assert_instance_of Chisel, chisel
  end

  # does not pass; actual return is nil
  def test_write_adds_text_to_file
      chisel = Chisel.new
      chisel.read('./lib/input_for_test.markdown')
      chisel.write('./lib/output_for_test.markdown')

      assert_equal "totally interesting stuff", chisel.read('./lib/output_for_test.markdown').chomp
  end

  def test_read_generates_string_of_text_from_target_file
    chisel = Chisel.new

    assert_equal "totally interesting stuff", chisel.read('./lib/input_for_test.markdown').chomp
  end

end
