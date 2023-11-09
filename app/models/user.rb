class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    with_options presence: true do
      validates :name
      validates :profile
      validates :occupation
      validates :position
    end
    has_many :prototypes, dependent: :destroy
    has_many :comments, dependent: :destroy
end