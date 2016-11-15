class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @brewery = Brewery.find(params[:followed_id])
    current_user.follow(@brewery)
    respond_to do |format|
      format.html { redirect_to @brewery }
      format.js
    end
  end

  def destroy
    @brewery = Relationship.find(params[:id]).followed
    current_user.unfollow(@brewery)
    respond_to do |format|
      format.html { redirect_to @brewery }
      format.js
    end
  end
end
