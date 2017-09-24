class User < ApplicationRecord
    validates :email, :password_confirmation,:f_name, :l_name, presence: true
    validates :email, uniqueness: true
    validates :password, :presence =>true,  :confirmation =>true
    validates_confirmation_of :password
    has_secure_password
end
