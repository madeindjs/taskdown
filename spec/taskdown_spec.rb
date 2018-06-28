require 'date'

RSpec.describe Taskdown do

  it "read tasks" do
    expected_tasks = [
      Task.new('Lait', false),
      Task.new('Farine', false),
      Task.new('Faire un article sur Rust', true),
      Task.new('Refaire un Article sur Rust', false, {deadline: Date.new(2018, 12, 31)}),
    ]

    tasks = Task.from_file("sample.taskdown")

    4.times do |i|
      expect(tasks[i].name).to eq(expected_tasks[i].name)
      expect(tasks[i].finished).to eq(expected_tasks[i].finished)
      expect(tasks[i].attributes).to eq(expected_tasks[i].attributes)
    end
  end

  it "has a version number" do
    expect(Taskdown::VERSION).not_to be nil
  end
end
