require_relative 'node'
require_relative 'tree'

tree = Tree.new

tree.add_route('account/workspaces/:workspace_id/members/:id')
tree.add_route('account/workspaces/:workspace_id/projects/:id')
tree.add_route('account/task/:id')


p tree
p tree.include?('account/task/:id')
p tree.include?('account/taskk/:id')
p tree.include?('account/workspaces/:workspace_id/members/:id')
p tree.include?('account/workspacess/:workspace_id/members/:id')
p tree.include?('account/workspaces/:workspace_id/projects/:id')
