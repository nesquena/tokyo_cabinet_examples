require 'rubygems'
require 'rufus/tokyo'

t = Rufus::Tokyo::Table.new('table.tct')

t['bob'] = { 'name' => 'alfred', 'age' => '22' }
t['pk1'] = { 'name' => 'bob', 'age' => '18' }
t['pk2'] = { 'name' => 'charly', 'age' => '45' }
t['pk3'] = { 'name' => 'doug', 'age' => '77' }
t['pk4'] = { 'name' => 'ephrem', 'age' => '32' }

p t.query { |q|
  q.add_condition 'age', :numge, '32'
  q.order_by 'age'
}
  # => [ {"name"=>"ephrem", :pk=>"pk4", "age"=>"32"},
  #      {"name"=>"charly", :pk=>"pk2", "age"=>"45"} ]

t.close

#
# Adds a condition
#
# table.query { |q|
# q.add 'name', :equals, 'Oppenheimer'
# q.add 'age', :numgt, 35
# }
#
# Understood 'operators' :
#
# :streq # string equality
# :eq
# :eql
# :equals
#
# :strinc # string include
# :inc # string include
# :includes # string include
#
# :strbw # string begins with
# :bw
# :starts_with
# :strew # string ends with
# :ew
# :ends_with
#
# :strand # string which include all the tokens in the given exp
# :and
#
# :stror # string which include at least one of the tokens
# :or
#
# :stroreq # string which is equal to at least one token
#
# :strorrx # string which matches the given regex
# :regex
# :matches
#
# # numbers...
#
# :numeq # equal
# :numgt # greater than
# :numge # greater or equal
# :numlt # greater or equal
# :numle # greater or equal
# :gt
# :ge
# :gte
# :lt
# :le
# :lte
# :numbt # a number between two tokens in the given exp
# :bt
# :between
# :numoreq # number which is equal to at least one token
#