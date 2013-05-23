ActiveAdmin.register User do

around_filter do |controller, action|
    User.class_eval do
      alias :__active_admin_to_param :to_param
      def to_param() _id.to_s end
    end

    begin
      action.call
    ensure
      User.class_eval do
        alias :to_param :__active_admin_to_param
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :username, member_label: :username
      f.input :email
      f.input :name
      f.input :password_digest
      f.input :avatar
      f.input :bio
    end
    f.buttons
  end

	index do
		id_column
		column :email
		column :username
		column :name
		column :bio
    column :avatar
		 
		default_actions
	end
  
end
