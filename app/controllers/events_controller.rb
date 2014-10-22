class EventsController < ApplicationController
  #Fill database with test data,
  #run once only.
  def test_init
    team = Team.create()

    1.upto(2) do |x|
      Project.create(
        title: 'project'+ x.to_s,
        team_id: team.id
      )
    end

    users = []
    1.upto(3) do |x|
      users[x] = User.create(
        name: 'user'+x.to_s
      )
      TeamUser.create( :team => team, :user=>users[x], :access=>x )
    end
    ProjectUser.create( :user => User.find(2), :project => Project.find(1) ) 
    ProjectUser.create( :user => User.find(3), :project => Project.find(2) )

    1.upto(20) do |x|
      todo = Todo.create(
        title: 'todo' + x.to_s,
        project_id: x%2 + 1
      )
      Event.create_todo(todo, users[x%3+1])   
    end

    render :text => 'Done'
  end

  def index
    current_user = User.find(params[:user])
    current_team = Team.last
    @events = current_user.events_in_team(current_team)
    @events = @events.limit(50).offset(params[:offset] || 0)
    puts @events
    render :json => @events.to_json
  end

end
