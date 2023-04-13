class Client < ApplicationRecord
    # validates :name, { presence: true, message: "Client not found" }

    has_many :memberships
    has_many :gyms, through: :memberships

    validates :memberships, absence: true
end
