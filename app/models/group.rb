class Group < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    
    belongs_to :user
    has_many :entities, dependent: :destroy
end