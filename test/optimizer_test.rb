gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/optimizer'
require_relative '../lib/matrix'

class OptimizerTest < MiniTest::Test

  def two_by_two
    [
      [0,0],
      [1,0]
    ]
  end

  def three_by_three
    [
      [0,0,0],
      [1,1,0],
      [1,1,0]
    ]
  end

  def matrix
    Matrix.new(two_by_two)
  end

  def matrix_3
    Matrix.new(three_by_three)
  end

  def test_it_returns_least_cost_path_for_2_by_2
    optimizer = Optimizer.new(matrix, [1,1], [2,2])
    path = [
             [1,1],
             [2,2]
           ]
    assert_equal path, optimizer.least_cost_path
  end

  def test_it_returns_least_cost_path_for_3_by_3
    optimizer = Optimizer.new(matrix_3, [1,1], [3,3])
    path = [
             [1,1],
             [2,1],
             [3,1],
             [3,2],
             [3,3]
           ]
    assert_equal path, optimizer.least_cost_path
  end

  def test_best_next_node_selects_least_available_resistance
    optimizer = Optimizer.new(matrix_3, [1,1], [3,3])
    next_node = optimizer.best_next_node([1,1])
    assert_equal [2,1], next_node
    next_node = optimizer.best_next_node([2,1])
    assert_equal [3,1], next_node
    next_node = optimizer.best_next_node([3,1])
    assert_equal [3,2], next_node

  end

  def test_finds_adjacent_nodes
    optimizer = Optimizer.new(matrix_3, [1,1], [3,3])
    adjacent_nodes = optimizer.adjacent_nodes_for([1,1])
    assert_equal [ [2,1], [2,2], [1,2] ].sort, adjacent_nodes.sort
  end

end
