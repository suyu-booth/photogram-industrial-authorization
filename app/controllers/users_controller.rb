class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed discover ]
  before_action :ensure_current_user_is_owner, only: [:feed, :discover]


  def index
    @users = @q.result
  end

  def feed
    
  end

  def discover
    
  end

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end
    
    def ensure_current_user_is_owner
      if params[:username] != current_user.username
        redirect_to feed_path(username: current_user.username), alert: "You're not authorized for that."
      end
    end

end
