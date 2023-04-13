class Gym < ApplicationRecord
    # validates :name, { presence: true, message: "Gym not found" }
    
    has_many :memberships, dependent: :destroy
    has_many :clients, through: :memberships

end
