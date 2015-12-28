require "todo/version"
require "todo/item"
require 'date'

module Todo
  class List
    attr_reader :title, :items

    def initialize(title, *items)
      @title = title
      @items = items
    end

    def due_today
      items.select { |i| i.due?(Date.today) }
    end

    def assigned_to(assignee)
      items.select { |i| i.assigned_to?(assignee) }
    end
  end
end
