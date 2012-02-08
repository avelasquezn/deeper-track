class HomeController < ApplicationController
  def index
  	unless current_user.blank? then
  		PivotalTracker::Client.use_ssl = true
  		PivotalTracker::Client.token(current_user.pivotaltracker_email, current_user.pivotaltracker_password)
  		PivotalTracker::Project.class_eval do
				def memberships_count
					self.memberships.all.count
				end
				def stories_count
					self.stories.all.count
				end
			end
  		@projects = PivotalTracker::Project.all
  	end
  end

end
