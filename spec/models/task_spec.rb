require 'rails_helper'

describe Task do
  let(:task)   { create(:task)   }
  let(:task_2) { create(:task_2) }
  let(:task_3) { create(:task_3) }
  let(:task_4) { create(:task_4) }

  it 'falls into No Deadline catagory without a date' do
    expect(Task.no_deadline).to eq [task_3, task_4]
  end

  it 'sorts pending tasks' do
    expect(Task.pending).to eq [task, task_4]
  end

  it 'sorts completed tasks' do
    expect(Task.completed_task).to eq [task_2, task_3]
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
