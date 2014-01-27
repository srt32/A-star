gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/matrix'
require_relative '../lib/node'

class MatrixTest < MiniTest::Test

  def two_by_two_with_one_resistance
    [
      [0,0],
      [0,1]
    ]
  end

  def three_by_three_with_one_resistance
    [
      [0,0,0],
      [0,1,0],
      [0,1,0]
    ]
  end

  def test_can_return_node_for_2_by_2
    matrix = Matrix.new(two_by_two_with_one_resistance)
    assert_kind_of Node, matrix.node_at(1,1)
    assert_equal 0, matrix.node_at(1,1).resistance
    assert_equal 1, matrix.node_at(2,2).resistance
  end

  def test_can_return_node_for_3_by_3
    matrix = Matrix.new(three_by_three_with_one_resistance)
    assert_kind_of Node, matrix.node_at(2,3)
    assert_equal 0, matrix.node_at(1,1).resistance
    assert_equal 1, matrix.node_at(2,2).resistance
    assert_equal 1, matrix.node_at(2,3).resistance
  end

end
