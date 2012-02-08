ActiveAdmin.register User do
   index do
   	column :email
   	column :created_at   	
   	default_actions
   end

   form do |f|
      f.inputs "Basic information" do
        f.input :email
        f.input :password
        f.input :password_confirmation, :label => 'Confirm password'
        f.input :remember_me, :label => 'Remind phrase'
      end
      f.inputs "Pivotal Tracker Account" do
        f.input :pivotaltracker_email, :label => 'email'
        f.input :pivotaltracker_password, :as => :password, :label => 'Password'
        f.input :pivotaltracker_token, :label => 'Token'
      end
      f.buttons
    end

    filter :email
end
