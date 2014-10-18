class Project < ActiveRecord::Base
  has_many :events, foreign_key: :project_id
  has_many :project_users
  has_many :users, :through => :project_users
  has_many :todos
  belongs_to :team
end
