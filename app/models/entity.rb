class Entity < ApplicationRecord
    belongs_to :user
    has_many :groups, dependent: :destroy
end