class Category < ApplicationRecord

    has_many :products
    acts_as_paranoid

    validates :name, presence: true

end