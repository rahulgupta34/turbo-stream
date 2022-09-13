class Form < ApplicationRecord
    validates :name, :body, presence: true
    validates :name, length: { in: 3..10 }
    validates :body, length: { in: 10..46 }

    enum :hobby, [:Cricket, :Running, :Fight, :others]

    # enum hobby: {
    #     cricket: "World Cricker Team",
    #     running: "Total Running"
    # }

end
