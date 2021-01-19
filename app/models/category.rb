class Category < ApplicationRecord

    has_many :products
    acts_as_paranoid
    acts_as_list

    validates :name, presence: true

    default_scope {order(position: :asc)}

end