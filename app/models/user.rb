class User < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :password, confirmation: true
validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
validates :firstname, :lastname, length: { maximum: 30 }
validates :age, :phone, numericality:{ :only_integer => true }
validates :email, :phone,  uniqueness: true
validates :password, :email, :phone, :firstname, :age, presence:true
validates :gender, inclusion: %w(male female)
end
