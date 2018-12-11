require 'benchmark'
require 'rr3'
require_relative 'lib/tree'
require_relative 'lib/node'

@tree = Tree.new.freeze
arr    = ["foo", "bar", "baz", "qux", "quux", "corge", "grault", "garply"]
paths  = arr.permutation(3).map { |a| "/#{a.join '/'}" }
paths.each do |path|
    #puts "r3_tree_insert_path(n, \"#{path}\", NULL, NULL);"
    @tree.add_route("#{path}", 'PUT').freeze
end
puts paths.length
#p @tree
puts Benchmark.measure { 1000.times { @tree.include?('account/workspaces/12/members/admin') } }

@tree_lib = Rr3::Tree.new(10)
paths.each do |path|
    @tree_lib.insert(1, "#{path}", 9527)
end
@tree_lib.compile!

puts Benchmark.measure { 1000.times { @tree_lib.match(1, "account/workspaces/{workspace_id}/members/{id}") } }
