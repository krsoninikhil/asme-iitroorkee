module SessionsHelper
	def log_in user
		session[:user_id] = user.id
	end
	
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end
	
	def logged_in?
		!current_user.nil?
	end
	
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end
	
	def current_mentee
		@current_mentee ||= Mentee.find_by(user_id: current_user.id)
	end
	
	def is_mentee?
		!current_mentee.nil?
	end
	
	def all_details_filled?
		if current_mentee.contact_no && current_mentee.enrollment_no && current_mentee.branch && current_mentee.receipt_no && current_mentee.sex ? true : false
		end
	end
end
