require 'rubygems'
require 'rufus/tokyo'

db = Rufus::Tokyo::Cabinet.new('data.tch')

db['nada'] = 'surf'

p db['nada'] # => 'surf'
p db['lost'] # => nil

db.close
