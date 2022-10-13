class User < ApplicationRecord
  # Include default devise modules. Others available are: :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :trades, foreign_key: :author_id, dependent: :destroy
  has_many :groups, foreign_key: :author_id, dependent: :destroy
  has_one_attached :avatar

  validates :name, presence: true
  validates_associated :trades, :groups
  validates :name, length: { minimum: 2 }
end
