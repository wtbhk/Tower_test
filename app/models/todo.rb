class Todo < ActiveRecord::Base
  belongs_to :project
  belongs_to :user, foreign_key: 'owner_id'
end
