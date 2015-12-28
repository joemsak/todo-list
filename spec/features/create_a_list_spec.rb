require 'spec_helper'

RSpec.describe 'Create a Todo List' do
  it 'creates with a title' do
    list = Todo::List.new('My list')
    expect(list.title).to eq('My list')
  end

  it 'lists items for today' do
    today = Todo::Item.new('Today', due_at: Date.today)
    tomorrow = Todo::Item.new('Tomorrow', due_at: Date.today + 1)

    list = Todo::List.new('My list', today, tomorrow)

    expect(list.due_today).to eq([today])
  end

  it 'filters items assigned to someone' do
    rick = Todo::Item.new('Pick Jerry up from Jerryboree', assignee: 'Rick')
    morty = Todo::Item.new('Enjoy a day at Blips & Chitz', assignee: 'Morty')

    list = Todo::List.new('Rick and Morty Adventure', rick, morty)

    expect(list.assigned_to('rick')).to eq([rick])
  end
end
