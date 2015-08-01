class UsersController < ApplicationController
	before_action :authenticate, :except => [:create]
	def authenticate
		redirect_to("/?login=false") if current_user.nil?
	end
	
  def profile
		@user = User.new
		@mentee = Mentee.new
		if is_mentee? && current_mentee.image
			@profile_pic = "uploads/#{current_mentee.image}"
		else 
			@profile_pic = "default.png"
		end
  end

  def edit_profile
		if is_mentee?			
			@mentee = Mentee.update(current_mentee.id, mentee_params)
		else
			@mentee = Mentee.new(mentee_params)
			@mentee.user_id = current_user.id
		end
		uploaded_io = params[:mentee][:image]
		file_ext = File.extname(uploaded_io.original_filename)
		@mentee.image = "image_#{current_mentee.id}_#{current_user.id}#{file_ext}" #uploaded_io.original_filename
		File.open(Rails.root.join('app/assets/images', 'uploads', @mentee.image), 'wb') do |file|
			file.write(uploaded_io.read)
		end
		if @mentee.save
			redirect_to(:back)
		else 
			redirect_to(:back)
		end
  end
	
	def create
		@user = User.new(user_params)
		flash[:success] = "Fill out the other details to download ICARD"
		flash[:danger] = "Please provide the valid details."
		if @user.save
			log_in @user
			redirect_to "/my-profile"
		else
			redirect_to "/?signup=failed"
		end
	end
	
	def mentee_entry
		@user = User.new(user_params)
		@mentee = Mentee.new
		if @user.save
			@mentee.user_id = @user.id
			if @mentee.save
				log_in @user
				redirect_to "/my-profile"
			end			
		else
			redirect_to(:back)
		end
	end
	
	private
	
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
	
	def mentee_params
		params.require(:mentee).permit(:contact_no, :enrollment_no, :branch, :sex, :receipt_no, :verified)
	end
end
