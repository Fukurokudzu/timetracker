require 'rails_helper'

RSpec.describe Task, type: :model do
  it "Correctly creates task stream name" do
    task = Task.new(project_id: 1)
    expect(task.stream_name).to eql("tasks_1")
  end
end
