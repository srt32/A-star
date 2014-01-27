gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'optimizer'
require_relative 'matrix'

class OptimizerTest < MiniTest::Test

  def two_by_two
    [
      [0,0],
      [1,0]
    ]
  end

  def matrix
    Matrix.new(two_by_two)
  end

  def test_it_returns_least_cost_path_for_2_by_2
    optimizer = Optimizer.new(matrix, [1,1], [2,2])
    path = [
             [1,1],
             [2,1],
             [2,2]
           ]
    assert_equal optimizer.least_cost_path, path
  end

end
