require "todo/version"
require "todo/item"

module Todo
  class List
    attr_reader :title, :items

    def initialize(title, *items)
      @title = title
      @items = items
    end

    def due_today
      items.select { |i| i.due_at == Date.today }
    end

    def assigned_to(assignee)
      items.select { |i| i.assignee.downcase == assignee.downcase }
    end
  end
end
