class Affiliation < ApplicationRecord
    belongs_to :clients, optional: true

    validates :name, presence: true
    validates :client_id, presence: true
    
end
