class User < ActiveRecord::Base
  has_many :events, foreign_key: :author_id
  has_many :team_users
  has_many :teams, :through => :team_users
  has_many :project_users
  has_many :projects, :through => :project_users
  has_many :todos
end
