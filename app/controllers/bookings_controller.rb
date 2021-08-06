class BookingsController < ApplicationController
    before_action :set_item, only: [:create, :show]
    before_action :set_booking, only: [:show, :destroy, :edit, :update]
    def index
        # =========displays "your bookings" page========
        # want to show all items that pending user's booking request
        @pendingitems = Booking.where(status: "pending", requesting_user_id: current_user.id).eager_load(:item)
        
        # show all items where booking has been approved by owner
        @approveditems = Booking.where(status: "approved", requesting_user_id: current_user.id).eager_load(:item)

        #show all items where booking has been declined by owner
        @declineditems = Booking.where(status: "declined", requesting_user_id: current_user.id).eager_load(:item)
    end

    def create
        # =========booking request form submission. form displayed in item's show page ============
        @booking = @item.bookings.new(booking_params)
        @booking.requesting_user_id = current_user.id
        @booking.save
        redirect_to bookings_path, notice: "Your booking request has been sent to the owner"
    end

    def show
        #==========shows item's booking. Requesting user can proceed to payment through here==========
        
    end

    def update
        # =========updates booking status through dashboard. changeable by owner of item ===========
        @booking.update_column(:status, params[:status])
        redirect_back fallback_location: dashboard_path, notice:"Booking status was successfully updated"
    end

    def edit
    end

    def destroy
        # ==========destroys booking request. can be deleted by requesting user =========
        @booking.destroy
        redirect_to bookings_path, notice: "Booking request was successfully destroyed"
    end


    private 
    def set_item
        @item = Item.find(params[:item_id])
    end
    def set_booking
        @booking = Booking.find(params[:id])
    end
    def booking_params
        params.require(:booking).permit(:requesting_user_id, :status, :no_of_days, :start_date)
    end
    
end
