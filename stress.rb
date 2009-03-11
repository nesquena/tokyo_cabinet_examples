require 'rubygems'
require 'rufus/tokyo'

db = Rufus::Tokyo::Cabinet.new('data.tch')

#1.upto(100000) do |ind|
#  db[ind.to_s] = ind.to_s
#end

db['5'] = { :key => 5 }

db.close