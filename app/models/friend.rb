class Friend < ApplicationRecord

    validates :name, presence: true
    validates :lastName, presence:true
    validates :age, presence:true
    validates :active, presence:true

end
