class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :delivery_addresse, dependent: :destroy
         
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :ruby_family_name, presence: true
  validates :ruby_first_name, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
end
