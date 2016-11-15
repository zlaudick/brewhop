class MicropostsController < ApplicationController
  before_action :logged_in_brewery, only: [:create, :destroy]
  before_action :correct_brewery,   only: :destroy

  def create
    @micropost = current_brewery.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to current_brewery
    else
      @feed_items = []
      redirect_to root_url
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_brewery
      @micropost = current_brewery.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
