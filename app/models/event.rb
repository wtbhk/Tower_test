class Event < ActiveRecord::Base

  TODO_CREATED = 1
  TODO_DELETED = 2
  TODO_COMPLETED = 3
  TODO_OWNED = 4
  TODO_OWNER_CHANGED = 5
  TODO_DEADLINE_CHANGED = 6
  TODO_COMMENTED = 7

  belongs_to :project
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :target, polymorphic: true
  
  serialize :author
  serialize :ext

  scope :recent, -> { order("created_at DESC") }
  scope :in_projects, -> (project_ids) { where(project_id: project_ids).recent }

  class << self
    def find_with_access(user, team)
      access = Access.where("user_id = ? AND team_id = ?", user.id, team.id).last.access
      projects_ids = []
      if access == Access::GUEST or access == Access::MEMBER
        project_ids = user.projects.where(:team_id => team.id).pluck(:id)
      else
        project_ids = team.projects.pluck(:id)
      end
      Event.in_projects(project_ids)
    end
    
    def create_todo(todo, user)
      create_event(todo, user, Event::TODO_CREATED, todo.title)      
    end

    def delete_todo(todo, user)
      create_event(todo, user, Event::TODO_DELETED, todo.title)
    end

    def complete_todo(todo, user)
      create_event(todo, uesr, Event::TODO_COMPLETED, todo.title)
    end

    def change_owner(todo, user, before, after)
      create_event(todo, user, Event::TODO_OWNER_CHANGED, todo.title, ext: {befor: befor, after:after})
    end

    def own_todo(todo, user, owner)
      create_event(todo, user, Event::TODO_OWNED, todo.title, ext: {after:owner})
    end

    def change_deadline(todo, user, before, after)
      create_event(todo, user, Event::TODO_DEADLINE_CHANGED, todo.title, ext: {befor: befor, after: after})
    end

    def comment_todo(todo, user, comment)
      create_event(todo, user, Event::TODO_COMMENTED, todo.title, comment.content)
    end

    private

    def create_event(target, user, action, title, content=nil, ext=nil)
      Event::create(
        target_id: target.id,
        target_type: target.class.name,
        author_id: user.id,
        author: user,
        action: action,
        project_id: target.project_id,
        title: title,
        content: content,
        ext: ext
      )
    end

  end  

end
