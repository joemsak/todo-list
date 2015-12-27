require 'spec_helper'

Todo::Item = Struct.new(:text) do
  attr_reader :assignee

  def assign_to(assignee)
    @assignee = assignee
  end

  def mark_complete
    @completed = true
  end

  def completed?
    @completed ||= false
  end
end

RSpec.describe Todo::Item do
  it 'is not completed' do
    item = described_class.new('Write a failing test')
    expect(item).not_to be_completed
  end

  it 'can be marked as complete' do
    item = described_class.new('Make items completable')
    item.mark_complete
    expect(item).to be_completed
  end

  it 'can be assigned to someone' do
    item = described_class.new('Make items assignable')
    item.assign_to('Rick')
    expect(item.assignee).to eq('Rick')
  end
end
