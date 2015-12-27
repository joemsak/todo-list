module Todo
  class Item
    attr_reader :text, :assignee, :due_at

    def initialize(text)
      @text = text
    end

    def assign_to(assignee)
      @assignee = assignee
    end

    def set_deadline(due_date)
      @due_at = due_date
    end

    def mark_complete
      @completed = true
    end

    def completed?
      @completed ||= false
    end
  end
end

