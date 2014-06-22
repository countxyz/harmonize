require 'rails_helper'

describe Task do
  it 'falls into No Deadline catagory without a date' do
    @no_deadline = create(:task)
    expect(Task.no_deadline).to eq [@no_deadline]
  end

  it 'sorts pending tasks' do
    task_1, task_2, task_3 = create(:task), create(:task_2), create(:task_3)
    expect(Task.pending).to eq [task_1, task_2]
  end

  it 'sorts completed tasks' do
    task_2, task_3, task_4 = create(:task_2), create(:task_3), create(:task_4)
    expect(Task.completed_task).to eq [task_3, task_4]
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
  
  describe 'presence' do
    it { should validate_presence_of(:description) }
  end

  describe 'field lengths' do
    it { should ensure_length_of(:description).is_at_most(100) }
  end
end
