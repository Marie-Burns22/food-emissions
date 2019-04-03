class Food < ActiveRecord::Base
  belongs_to :student

  validates :ghg_amount, numericality: { greater_than: 0 }
  validates :ghg_amount, numericality: { less_than: 10 }
end
