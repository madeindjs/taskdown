class Task
  attr_reader :name, :finished

  # Create many task from given filepath
  # @param filepath <String> filepath of readable markdown file
  def self.from_file filepath
    tasks = []

    File.read(filepath).scan(/- \[( |X)\] (.*)/).each do |data|
      task = Task.new data[1], (data[0] == 'X')
      tasks << task
      yield if block_given?
    end

    return tasks
  end

  def initialize(name, finished)
    @name = name
    @finished = finished
  end

end
