require_relative 'node'

class Matrix
  attr_reader :resistances,
              :nodes

  def initialize(resistances)
    @resistances = resistances
    @nodes = create_nodes
  end

  def node_at(x,y)
    @nodes[y-1][x-1]
  end

  private

  def create_nodes
    @resistances.map.with_index do |row,r|
      row.map.with_index do |cell,c|
        Node.new(:resistance => @resistances[r][c])
      end
    end
  end

end
