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
    today = double(:today, due_at: Date.today)
    tomorrow = double(:tomorrow, due_at: Date.today + 1)

    list = described_class.new('Show me today', today, tomorrow)

    expect(list.due_today).to eq([today])
  end

  it 'lists todo items for an assignee' do
    rick = double(:today, assignee: 'Rick')
    morty = double(:tomorrow, assignee: 'Morty')

    list = described_class.new('Show me Morty', rick, morty)

    expect(list.assigned_to('morty')).to eq([morty])
  end
end
