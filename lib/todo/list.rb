require "todo/version"
require "todo/item"

module Todo
  class List
    attr_reader :title, :items

    def initialize(title, *items)
      @title = title
      @items = items
    end
  end
end
