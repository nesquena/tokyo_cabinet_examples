require 'rubygems'
require 'rufus/tokyo'

t = Rufus::Tokyo::Table.new('../data/table2.tct')

t['bob']    = { 'num' => '12' }
t['frank']  = { 'num' => '20' }
t['george'] = { 'num' => '5' }

p t.query { |q|
  q.add_condition 'num', :numge, '12'
  q.order_by 'word'
  q.limit 5
}

t.close