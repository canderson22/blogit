class User < ApplicationRecord
    has_many :blogs
    has_many :comments
    validates :email, :password_confirmation,:f_name, :l_name, presence: true
    validates :email, uniqueness: true
    validates :password, :presence =>true,  :confirmation =>true
    validates_confirmation_of :password
    has_secure_password
    has_attached_file :image,
    styles: {
        medium: "300x300>", thumb: "150x150>"
    },
    default: "/images/:style/missing.png"

validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/ 
end
