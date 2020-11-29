class User < ApplicationRecord
    has_secure_password

    has_many :nutritionreports

    validates :name, presence: { message: "Must be given please" }
    validates :username, presence: { message: "Must be given please" }
    validates :password, presence: { message: "Must be given please" }
    validates :email, presence: { message: "Must be given please" }

    validates :username, uniqueness: true

    validates :name, length: { minimum: 3 }
    validates :username, length: { minimum:  3}
    validates :password, length: { in: 6..20 }
    validates :email, email: true        
end