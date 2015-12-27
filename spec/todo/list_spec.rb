require 'spec_helper'

describe Todo::List do
  it 'has a title' do
    list = described_class.new('Things to do today')
    expect(list.title).to eq('Things to do today')
  end

  it 'lists todo items' do
    item1 = double(:item1)
    item2 = double(:item2)
    list = described_class.new('My list', item1, item2)

    expect(list.items).to eq([item1, item2])
  end
end
