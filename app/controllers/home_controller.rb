class HomeController < ApplicationController
  def index
  	if current_user then
      if current_user.with_pivotaltracker_token?
    		PivotalTracker::Client.use_ssl = true
        PivotalTracker::Client.token = current_user.pivotaltracker_token
    		PivotalTracker::Client.connection
    		PivotalTracker::Project.class_eval do
  				def memberships_count
  					0 + self.memberships.all.count
  				end
  				def stories_count
  					0 + self.stories.all.count
  				end
  			end
    		@projects = PivotalTracker::Project.all
      end
    end
  end
end
