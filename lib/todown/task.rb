class Task
  attr_reader :name, :finished, :attributes

  # Create many task from given filepath
  # @param filepath <String> filepath of readable markdown file
  def self.from_file filepath
    tasks = []

    File.read(filepath).scan(/- \[( |X|x)\] (.+)/).each do |data|
      task = Task.new data[1], (data[0] != ' ')
      tasks << task
      yield task if block_given?
    end

    return tasks
  end

  def initialize(name, finished = false, attributes = {})
    @name = name
    @finished = finished
    @attributes = attributes

    parse_attributes!
  end

  private

  def parse_attributes!
    @name.scan(/@([a-z]*)=(\S+)/).each do |data|
      # insert as attribute
      key = data[0].to_sym
      value = data[1]
      @name.gsub! "@#{key}=#{value}", ''
      @name.strip!
      begin
        value = Date.parse value
      rescue Exception => e
      end
      @attributes[key] = value
    end
  end

end
