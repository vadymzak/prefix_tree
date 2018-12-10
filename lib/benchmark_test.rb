require 'benchmark'
require 'rr3'
require_relative 'tree'
require_relative 'node'



@tree = Tree.new.freeze
@tree.add_route('account/workspaces/:workspace_id/members/:id', 'PUT').freeze
@tree.add_route('account/workspaces/:workspace_id/projects/:id', 'GET').freeze
@tree.add_route('account/task/:id', 'POST').freeze

@tree_lib = Rr3::Tree.new(3)
@tree_lib.insert "account/workspaces/{:workspace_id}/members/{:id}"

@tree_lib.insert "account/workspaces/{:workspace_id}/projects/{:id}"
@tree_lib.insert "account/task/{:id}"
puts Benchmark.measure { 1000.times do @tree.include?('account/workspaces/12/members/admin') end }
