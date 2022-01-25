class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    self.family_name + " " + self.first_name
  end

  def full_ruby_name
    self.ruby_family_name + " " + self.ruby_first_name
  end

  has_many :delivery_addresses, dependent: :destroy
  has_many :order, dependent: :destroy

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :ruby_family_name, presence: true
  validates :ruby_first_name, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  has_many :cart_items, dependent: :destroy

  def active_for_authentication?
    super && (self.member_status == false)
  end
end
