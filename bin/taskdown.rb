#!/usr/bin/env ruby
require 'taskdown'
require 'terminal-table'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
end.parse!


rows = []
headings = ['', 'Name', 'Attributes']

tasks = Task.from_file "sample.taskdown" do |task|
  status = task.finished ? 'X' : ''

  row = [status, task.name, task.attributes.to_s]

  rows << row
end

table = Terminal::Table.new rows: rows, headings: headings

puts table
