class Group < ApplicationRecord
    has_many :members
    has_many :concerts
    has_many :albums

    validates :name, presence: true
    
end
