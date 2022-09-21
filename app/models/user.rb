class User < ApplicationRecord
    validates :name, :age, :email, presence: true

    after_create_commit  { broadcast_prepend_to "users" }

end
