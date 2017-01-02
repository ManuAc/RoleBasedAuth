class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, join_table: 'user_roles'
  has_many :rules, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
