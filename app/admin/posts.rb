ActiveAdmin.register Post do
  around_filter do |controller, action|
    Post.class_eval do
      alias :__active_admin_to_param :to_param
      def to_param() _id.to_s end
    end

    begin
      action.call
    ensure
      Post.class_eval do
        alias :to_param :__active_admin_to_param
      end
    end
  end

  form do |f|
  	f.inputs do
      f.input :user, member_label: :username
  		f.input :category
  		f.input :title
  		f.input :body
  		f.input :image
  		f.input :is_featured
  	end
  	f.buttons
  end

  index do
    id_column
    column :user
    column :title
    column :is_featured
    default_actions
  end


end
