RSpec.describe Taskdown do

  it "read tasks" do

    expected_tasks = [
      Task.new('Lait', false),
      Task.new('Farine', false),
      Task.new('Faire un article sur Rust', true),
      Task.new('"Refaire un Article sur Rust @deadline=2018-12-31', false),
    ]

    tasks = Task.from_file("sample.taskdown")

    4.times do |i|
      expect(expected_tasks[i].name).to eq(expected_tasks[i].name)
      expect(expected_tasks[i].finished).to eq(expected_tasks[i].finished)
    end

  end

  it "has a version number" do
    expect(Taskdown::VERSION).not_to be nil
  end
end
