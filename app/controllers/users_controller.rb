class UsersController < ApplicationController
	before_action :authenticate, :except => [:create, :mentee_entry]
	def authenticate
		redirect_to("/?login=false") if current_user.nil?
	end
	
  def profile
		@user = User.new
		@mentee = Mentee.new
		if is_mentee? && current_mentee.image
			@profile_pic = "v2/#{current_mentee.image}"
		else 
			@profile_pic = "default_zigoby.png"
		end
  end

  def edit_profile
		if is_mentee?			
			@mentee = Mentee.update(current_mentee.id, mentee_params)
		else
			@mentee = Mentee.new(mentee_params)
			@mentee.user_id = current_user.id
		end
		if params[:mentee][:image]
			 uploaded_io = params[:mentee][:image]
			 file_ext = File.extname(uploaded_io.original_filename)
			 @mentee.image = "image_#{current_mentee.id}_#{current_user.id}#{file_ext}" #uploaded_io.original_filename
			 File.open(Rails.root.join('app/assets/images', 'uploads', @mentee.image), 'wb') do |file|
				 file.write(uploaded_io.read)
			 end
			 Cloudinary::Uploader.upload(File.open(Rails.root.join('app/assets/images', 'uploads', @mentee.image)), :public_id => "image_#{current_mentee.id}_#{current_user.id}")
		end
		# if params[:image].present?
			# preloaded = Cloudinary::PreloadedFile.new(params[:image])         
			# raise "Invalid upload signature" if !preloaded.valid?
			# @mentee.image = preloaded.identifier
		# end
		if @mentee.save
			redirect_to "/my-profile/?saved=true"
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
			redirect_to "/mentorship/?registration=failed"
		end
	end
	
	def id_card
		#@user = User.new
		if !all_details_filled?
			redirect_to "/my-profile?details_check=failed" and return
		end		
		respond_to do |format|
      format.html
			format.pdf do
        render pdf: "robotic-mentorship-id-card-2015-16"   # Excluding ".pdf" extension.
      end
    end
  end
	
	def download_lectures
		if params[:lecture].in?(['l1.pdf', 'l2.pptx', 'l3.pptx']) 
			redirect_to "/data/"+params[:lecture] 
		else 
			redirect_to "/activities?conducted=false"
		end
	end
	
	private
	
	def all_details_filled?
		current_mentee.contact_no && current_mentee.enrollment_no && current_mentee.branch && current_mentee.receipt_no && current_mentee.sex && current_mentee.image ? true : false
	end
	
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
	
	def mentee_params
		params.require(:mentee).permit(:contact_no, :enrollment_no, :branch, :sex, :receipt_no, :verified)
	end
end
