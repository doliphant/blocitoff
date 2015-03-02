class Item < ActiveRecord::Base
  belongs_to :list

  scope :default_order, -> () { order('items.created_at ASC') }

  def days_left
    6 - (DateTime.now.to_date - created_at.to_date).to_i
  end

end
