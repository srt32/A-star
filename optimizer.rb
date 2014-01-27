require 'pry'

class Optimizer
  attr_reader :start_node,
              :goal_node,
              :matrix

  attr_accessor :visited_nodes

  def initialize(matrix, start_node, goal_node)
    @start_node = start_node
    @goal_node = goal_node
    @matrix = matrix
    @visited_nodes = []
  end

  def least_cost_path
    path = []
    path << start_node
    visited_nodes << start_node
    starting_node = @start_node
    loop do
      next_node = best_next_node(starting_node)
      path << next_node
      starting_node = next_node
      break if starting_node == goal_node
    end
    path
  end

  def best_next_node(current_position)
    adjacent_nodes = adjacent_nodes_for(current_position)

    return goal_node if adjacent_nodes.include?(goal_node)

    available_adjacent_nodes = adjacent_nodes.reject do |node|
      visited_nodes.include?(node)
    end

    next_best_node = available_adjacent_nodes.min_by do |node|
      matrix.node_at(node[0],node[1]).resistance
    end
  end

  def adjacent_nodes_for(current_position)
    nodes = []
    curr_x = current_position[0]
    curr_y = current_position[1]
    max_size = matrix.resistances.length # MOVE INTO MATRIX CLASS
    unless curr_x == max_size
      nodes << [curr_x + 1, curr_y]
    end
    unless curr_y == max_size
      nodes << [curr_x, curr_y + 1]
    end
    unless curr_y == max_size || curr_x == max_size
      nodes << [curr_x + 1, curr_y + 1]
    end
    nodes
  end

end
