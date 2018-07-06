require 'date'

RSpec.describe Todown do

  it "has a version number" do
    expect(Todown::VERSION).not_to be nil
  end

  it "read tasks" do
    expected_tasks = [
      Task.new('Milk', true),
      Task.new('Sugar', false),
      Task.new('Chocolate', false, {due: Date.new(2019, 2, 14)}),
    ]

    tasks = Todown.tasks_from_file("sample.markdown")

    3.times do |i|
      expect(tasks[i].name).to eq(expected_tasks[i].name)
      expect(tasks[i].finished).to eq(expected_tasks[i].finished)
      expect(tasks[i].attributes).to eq(expected_tasks[i].attributes)
    end
  end

  it "convert tasks to table" do
    tasks  = [
      Task.new("One @due=2018-01-01"),
      Task.new("Two @until=dawn"),
      Task.new("Two b @until=dawn"),
      Task.new("Three"),
    ]

    hash_data = Todown.task_to_hash_table(tasks)


    expect(hash_data[:headings]).to eq ['', 'Name', 'due', 'until']
    expect(hash_data[:rows]).to eq [
      ['', 'One', '2018-01-01', ''],
      ['', 'Two', '', 'dawn'],
      ['', 'Two b', '', 'dawn'],
      ['', 'Three', '', ''],
    ]
  end

end
