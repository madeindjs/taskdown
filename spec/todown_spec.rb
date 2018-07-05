require 'date'

RSpec.describe Todown do

  it "has a version number" do
    expect(Todown::VERSION).not_to be nil
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
