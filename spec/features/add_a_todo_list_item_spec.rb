require 'spec_helper'

RSpec.describe 'Add a todo list item' do
  it 'adds directly to the list' do
    list = Todo::List.new('Add to me')

    list.add_item(text: 'Add this item to the list',
                  assignee: 'Joe',
                  due_at: Date.today)

    todo = list.items.first

    expect(todo.text).to eq('Add this item to the list')
    expect(todo).to be_assigned_to('Joe')
    expect(todo).to be_due(Date.today)
    expect(todo).not_to be_completed
  end
end
