class Item < ActiveRecord::Base
  belongs_to :list

  scope :default_order, -> () { order('items.created_at ASC') }

  def days_to_complete
    7.days
  end

  def due_date
    created_at.to_date + days_to_complete
  end


  def days_left
    (due_date - DateTime.now.to_date).to_i
  end

end

module ItemsHelper

  def remaining_time(days_left)
    if days_left > 1
      "#{days_left} days"
    elsif days_left == 0
      "Due Today!"
    else
      "Overdue!!"
    end
  end
end
