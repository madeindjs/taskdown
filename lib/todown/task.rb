# Represent a task extracted from markdown file
class Task
  # @return [String] The name of the task
  attr_reader :name
  # @return [Boolean] The status of the task (`true` for completed, `false` for to do)
  attr_reader :finished
  # @return [Hash] an hash containing various attributes
  attr_reader :attributes

  # Returns a new instance of Task
  #
  # @param name [String]
  # @param finished [Boolean]
  # @param attributes [Hash] an hash containing various attributes
  def initialize(name, finished = false, attributes = {})
    @name = name
    @finished = finished
    @attributes = attributes

    parse_attributes!
  end

  private

  # Try to parse attributes from `Task.name`
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
