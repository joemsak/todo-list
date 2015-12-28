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

  it 'lists todo items due today' do
    today = double(:today, :due? => true)
    tomorrow = double(:tomorrow, :due? => false)

    list = described_class.new('Show me today', today, tomorrow)

    expect(list.due_today).to eq([today])
  end

  it 'lists todo items for an assignee' do
    rick = double(:rick, :assigned_to? => false)
    morty = double(:morty, :assigned_to? => true)

    list = described_class.new('Show me Morty', rick, morty)

    expect(list.assigned_to('morty')).to eq([morty])
  end
end
