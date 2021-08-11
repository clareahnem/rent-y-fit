class AddressesController < ApplicationController
    before_action :set_address, only: [:edit, :update]
    before_action :authenticate_user!

    def show
        # page that shows current user's account information (email, username, addresses)
        @user = User.find(params[:id]) 
        @address = Address.find_by(user_id: current_user.id)
    end
    def edit
        # edit address info
    end
    def update
        # update address info
        @address.update(address_params)
        redirect_to address_path(current_user), notice: "Successfully updated your address"
    end

    private
    def set_address
        @address = Address.find(params[:id])
    end
    
    def address_params
        params.require(:address).permit(:user_id, :street_no, :street, :suburb, :postcode)
    end
end
