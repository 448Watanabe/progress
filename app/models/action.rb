class Action < ApplicationRecord
  belongs_to :clients, optional: true
  
  validates :content, presence: true
  validates :state, presence: true
  # validates :expectation, presence: true
end
