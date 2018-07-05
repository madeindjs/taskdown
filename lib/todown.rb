require "todown/version"
require "todown/task"
require 'terminal-table'

module Todown

  # Create a `Terminal::Table` from many task
  #
  # @param tasks [Array<Task>]
  # @return [Terminal::Table]
  def self.task_to_table tasks
    return Terminal::Table.new(Todown.task_to_hash_table(tasks))
  end

  # Manipulate data to transform in the expected format for `Terminal::Table`
  #
  # @param tasks [Array<Task>]
  # @return [Hash<Symbol, Array>]
  def self.task_to_hash_table tasks
    rows = []
    attributes_keys = []

    tasks.each do |task|
      task.attributes.keys.each {|key| attributes_keys << key.to_s }
    end

    attributes_keys.uniq!

    headings = ['', 'Name'].concat attributes_keys

    tasks.each do |task|
      row = []
      row << (task.finished ? 'X' : '')
      row << task.name

      # Insert attributes in the same order
      attributes_keys.each do |attribute_key|
        attribute_value = task.attributes[attribute_key.to_sym]
        if attribute_value
          row << attribute_value.to_s
        else
          row << ''
        end
      end

      rows << row
    end

    return {rows: rows, headings: headings }
  end

end
