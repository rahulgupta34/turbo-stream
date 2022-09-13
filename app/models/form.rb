class Form < ApplicationRecord
    validates :name, :body, presence: true
    validates :name, length: { in: 3..10 }
    validates :body, length: { in: 10..46 }
end
