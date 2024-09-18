class User < ApplicationRecord
    validates :name, presence: true, length: {minimum:2, maximum:8}
    validates :s_number, presence: true, uniqueness: true
    validates :password, presence: true, format: {with: /\A[0-9]+\z/, multiline: true}
end
