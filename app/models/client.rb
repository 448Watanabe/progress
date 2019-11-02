class Client < ApplicationRecord
    has_many :actions, dependent: :destroy
    has_many :affiliations, dependent: :destroy

    validates :name, presence: true
end
