class HomeController < ApplicationController
  def index
    @projects = nil
  	if current_user then
      if current_user.with_pivotaltracker_token?
        begin
          PivotalTracker::Project.class_eval do
            def memberships_count
              self.memberships.all.count
            end
            def stories_count
              self.stories.all.count
            end
          end
          PivotalTracker::Client.class_eval do
            def self.token(new_token)
              @token = new_token
            end
          end
      		PivotalTracker::Client.use_ssl = true         
          PivotalTracker::Client.token(current_user.pivotaltracker_token)
      		PivotalTracker::Client.connection
        rescue PivotalTracker::Client::NoToken  
          return
        else
          PivotalTracker::Client.token(current_user.pivotaltracker_token)       
    		  @projects = PivotalTracker::Project.all
        end  
      end
    end
  end
end
