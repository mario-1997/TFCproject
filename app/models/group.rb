class Group < ApplicationRecord
    has_many :members
    has_many :concerts
    has_many :albums

    validates :name,:musical_style, presence: true
    
end
