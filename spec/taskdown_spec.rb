require 'date'

RSpec.describe Taskdown do

  it "read tasks" do
    expected_tasks = [
      Task.new('Milk', true),
      Task.new('Sugar', false),
      Task.new('Chocolate', false, {due: Date.new(2019, 2, 14)}),
    ]

    tasks = Task.from_file("sample.taskdown")

    3.times do |i|
      expect(tasks[i].name).to eq(expected_tasks[i].name)
      expect(tasks[i].finished).to eq(expected_tasks[i].finished)
      expect(tasks[i].attributes).to eq(expected_tasks[i].attributes)
    end
  end

  it "has a version number" do
    expect(Taskdown::VERSION).not_to be nil
  end

  it "Should parse date attribute" do
    task = Task.new "Hello @due=1992-12-28"
    expect(task.name).to eq('Hello')
    expect(task.attributes[:due]).to eq(Date.new 1992, 12, 28)
  end

  it "Should parse string attribute" do
    task = Task.new "Hello @due=today"
    expect(task.name).to eq('Hello')
    expect(task.attributes[:due]).to eq('today')
  end

  it "Should parse with string attribute & date attribute" do
    task = Task.new "Make something great @due=today @tag=world"
    expect(task.name).to eq('Make something great')
    expect(task.attributes[:due]).to eq('today')
    expect(task.attributes[:tag]).to eq('world')
  end
end
