Overview
============

Just a place for me to keep experiments with Tokyo Cabinet which is a persistent hash which is extremely efficient. 

If you have any fun examples of usage, feel free to fork and add them in!

These examples were originally pulled from the tokyo documentation and blog posts and adapted by Nathan Esquenazi.


Resources
==========

 * http://tokyocabinet.sourceforge.net/rubydoc/
 * http://www.igvita.com/2009/02/13/tokyo-cabinet-beyond-key-value-store/
 * http://jmettraux.wordpress.com/2009/01/23/ruby-ffi-tokyo-cabinet/
 * http://www.scribd.com/doc/12016121/Tokyo-Cabinet-and-Tokyo-Tyrant-Presentation

Installation
============

This is a simple guide to installing Tokyo Cabinet and using the system with Ruby.

First install Tokyo Cabinet:

    git clone git://github.com/etrepum/tokyo-cabinet.git
    cd tokyo-cabinet/
    ./configure
    make
    sudo make install

Then install the ruby bindings:

    sudo gem install ffi
    sudo gem install rufus-tokyo

Usage
======

Tokyo Cabinet with Basic Store:

    require 'rubygems'
    require 'rufus/tokyo'

    db = Rufus::Tokyo::Cabinet.new('data.tch')

    db['nada'] = 'surf'

    p db['nada'] # => 'surf'
    p db['lost'] # => nil

    db.close
    
and with Table Store:

    require "rubygems"
    require "rufus/tokyo/cabinet/table"
 
    t = Rufus::Tokyo::Table.new('table.tdb', :create, :write)
 
    t['pk0'] = { 'name' => 'alfred', 'age' => '22', 'sex' => 'male' }
    t['pk1'] = { 'name' => 'bob', 'age' => '18' }
    t['pk2'] = { 'name' => 'charly', 'age' => '45', 'nickname' => 'charlie' }
    t['pk3'] = { 'name' => 'doug', 'age' => '77' }
    t['pk4'] = { 'name' => 'ephrem', 'age' => '32' }
 
    p t.query { |q|
      q.add_condition 'age', :numge, '32'
      q.order_by 'age'
    }
    
    t.close

Check the examples folder for additional usage samples! Or feel free to fork and add your own.
