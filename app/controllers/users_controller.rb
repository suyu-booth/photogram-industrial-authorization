class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked ]
  before_action :set_user2, only: %i[ feed discover]
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

    def set_user2
      if (params[:username]) && (params.fetch(:username) != current_user.username)
        redirect_back fallback_location: root_url, alert: "You're not authorized for that."
      else
        @user = current_user
      end
    end

end
