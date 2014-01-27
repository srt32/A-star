class Optimizer
  attr_reader :start_node,
              :goal_node,
              :matrix

  def initialize(matrix, start_node, goal_node)
    @start_node = start_node
    @goal_node = goal_node
    @matrix = matrix
  end

  def least_cost_path
    path = []
    path << start_node
    while start_node != goal_node do
      next_node = best_next_node(start_node)
      path << next_node
      start_node = next_node
    end
    [
      start_node,
      [2,1],
      goal_node
    ]
    path
  end

  def best_next_node(current_position)
    adjacent_nodes = adjacent_nodes_for(current_position)
    return goal_node if adjacent_nodes.include?(goal_node)
    next_best_node = adjacent_nodes.min_by do |node|
      matrix.node_at(node[0],node[1]).resistance
    end
  end

  def adjacent_nodes_for(current_position)
    nodes = []
    curr_x = current_position[0]
    curr_y = current_position[1]
    # want to add/subtract unless the node is at max/min
    nodes << [curr_x + 1, curr_y]
    nodes << [curr_x, curr_y + 1]
    nodes << [curr_x + 1, curr_y + 1] # additions are duplicated, optimize
  end

end
