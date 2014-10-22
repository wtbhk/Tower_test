class User < ActiveRecord::Base
  has_many :events, foreign_key: :author_id
  has_many :team_users
  has_many :teams, :through => :team_users
  has_many :project_users
  has_many :projects, :through => :project_users
  has_many :todos

  def events_in_team(team)
    if self.access_in_team == Access::ADMIN
      project_ids = self.projects.where(:team_id => team.id).pluck(:id)
    else
      project_ids = team.projects.pluck(:id)
    end
    Event.in_projects(project_ids)
  end

  def access_in_team(team)
    Access.where("user_id = ? AND team_id = ?", self.id, team.id).last.access
  end

end
