class AccountsController < ApplicationController
    before_action :set_variables
    before_action :authenticate_user!

    def show
        # page that shows current user's account information (email, username, addresses)
    end
    def edit
        # edit address info
    end
    def update
        # update address info
    end

    private
    def set_variables
        @user = User.find(params[:id]) 
        @address = Address.find_by(user_id: current_user.id)
    end
end
