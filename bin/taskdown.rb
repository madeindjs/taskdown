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

Task.from_file("sample.taskdown").map do |task|
  status = task.finished ? 'X' : ''

  rows << [status, task.name]
end

table = Terminal::Table.new rows: rows, headings: ['', 'Name']

puts table
