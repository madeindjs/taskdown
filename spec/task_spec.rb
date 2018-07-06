require 'date'

RSpec.describe Task do

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
