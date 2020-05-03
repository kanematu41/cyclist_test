class RelationshipsController < ApplicationController

	def follow
	  current_user.follow(params[:id])
	  redirect_back(fallback_location: root_path)
	end

	def unfollow
	  current_user.unfollow(params[:id])
	  redirect_back(fallback_location: root_path)
	end

  def follows
  	@user = User.find(params[:id])
  	@follows = @user.following_user
  end

  def followers
  	@user = User.find(params[:id])
  	@followers = @user.follower_user
  end
end
