gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'

class NodeTest < MiniTest::Test

  def test_it_accepts_resistance
    node = Node.new(:resistance => 0)
    assert_equal 0, node.resistance
  end

end
