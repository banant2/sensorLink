class User < ActiveRecord::Base
  has_many :plants
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :name, presence: true
end
