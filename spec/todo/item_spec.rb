require 'spec_helper'

Todo::Item = Struct.new(:text) do
  def completed?
    @completed ||= false
  end
end

RSpec.describe Todo::Item do
  it 'is not completed' do
    item = described_class.new('Write a failing test')
    expect(item).not_to be_completed
  end
end
