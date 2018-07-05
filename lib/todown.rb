require "todown/version"
require "todown/task"
require 'terminal-table'

module Todown

  # Create a `Terminal::Table` from many task
  #
  # @param tasks [Array<Task>]
  # @return [Terminal::Table]
  def self.task_to_table tasks
    rows = []
    headings = ['', 'Name', 'Attributes']

    tasks.each do |task|
      status = task.finished ? 'X' : ''
      rows << [status, task.name, task.attributes.to_s]
    end

    return Terminal::Table.new rows: rows, headings: headings
  end
end
