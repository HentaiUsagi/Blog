class User < ApplicationRecord
  has_many :posts, through: :nil

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :lockable
end
