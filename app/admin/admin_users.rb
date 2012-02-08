ActiveAdmin.register AdminUser do
   index do
   	column :email
   	column :created_at   	
   	default_actions
   end

   form do |f|
      f.inputs "Details" do
        f.input :email
        f.input :password
        f.input :password_confirmation, :label => 'Confirm password'
        f.input :remember_me, :label => 'Remind phrase'
      end
      f.buttons
    end

    filter :email  
end
