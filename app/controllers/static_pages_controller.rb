class StaticPagesController < ApplicationController
  def index
		@user = User.new #as signup can be done on any page so @user must be defined in every controller
  end

  def activities
		@user = User.new
  end

  def events
		@user = User.new
  end

  def involvements
		@user = User.new
  end

  def mentorship
		@user = User.new
  end

   def gallery
    @user = User.new
  end
	
	def contact_us
		@user = User.new
	end
end
