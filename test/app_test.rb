require 'minitest/autorun'
require_relative '../lib/tree'
require_relative '../lib/node'
# Tests
class AppTest < Minitest::Test
  def setup
    @tree = Tree.new.freeze
    @tree.add_route('account/workspaces/:workspace_id/members/:id', 'PUT').freeze
    @tree.add_route('account/workspaces/:workspace_id/projects/:id', 'GET').freeze
    @tree.add_route('account/task/:id', 'POST').freeze
  end

  def test_true_on_valid_route_1
    assert_equal @tree.include?('account/workspaces/12/members/admin'), true
    p @tree.route_obj
  end

  def test_false_on_not_valid_route_1
    assert_equal @tree.include?('account/workspacess/12/projects/admin'), false
  end

  def test_true_on_valid_route_2
    assert_equal @tree.include?('account/task/5'), true
  end

  def test_false_on_not_valid_route_2
    assert_equal @tree.include?('account/taskk/:id'), false
  end

  def test_true_on_valid_route_3
    assert_equal @tree.include?('account/workspaces/aaa/projects/12'), true
  end

  def test_false_on_not_valid_route_3
    assert_equal @tree.include?('account/workspaces/aaa/projectss/12'), false
  end
end
