class User < ApplicationRecord
  has_many :places
  validates :code, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  enum role: { normal: 0, admin: 1 }
end
