class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :description, presence: true
  validates :age, numericality: { greater_than: 0, less_than: 120 }

  has_many :posts
  has_and_belongs_to_many :projects
end
