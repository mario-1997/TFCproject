class Member < ApplicationRecord
    belongs_to :group

    validates :name, :surname, :ocupation, :dni, presence: true
end
