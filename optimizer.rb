require 'pry'

class Optimizer
  attr_reader :start_node,
              :goal_node,
              :matrix

  attr_accessor :path

  def initialize(matrix, start_node, goal_node)
    @start_node = start_node
    @goal_node = goal_node
    @matrix = matrix
    @path = [start_node]
  end

  def least_cost_path(starting_node = @start_node)
    path << next_node = best_next_node(starting_node)
    return path if next_node == goal_node
    least_cost_path(next_node)
  end

  def best_next_node(current_position)
    adjacent_nodes = adjacent_nodes_for(current_position)
    return goal_node if adjacent_nodes.include?(goal_node)
    avail_adjacent_nodes = adjacent_nodes.reject {|node| path.include?(node) }
    avail_adjacent_nodes.min_by {|node| resistance_for(node) }
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

  private

  def resistance_for(node)
    matrix.node_at(node[0],node[1]).resistance
  end

end
