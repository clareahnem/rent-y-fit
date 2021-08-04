class BookingsController < ApplicationController
    before_action :set_item, only: [:create]
    def index
        # want to show all items that pending user's booking request
        @pendingitems = Booking.where(status: "pending", requesting_user_id: current_user.id).preload(:item)
        
        # show all items where booking has been approved by owner
        @approveditems = Booking.where(status: "approved", requesting_user_id: current_user.id).preload(:item)

        #show all items where booking has been declined by owner
        @declineditems = Booking.where(status: "declined", requesting_user_id: current_user.id).preload(:item)

    end

    def create
    # booking request form submission
      @booking = @item.bookings.new(booking_params)
      @booking.requesting_user_id = current_user.id
      @booking.save
      redirect_to bookings_path, notice: "Your booking request has been sent to the owner"
    end

    def show
    end

    def update
    end

    def edit
    end

    def delete
    end

    private 
    def set_item
        @item = Item.find(params[:item_id])
    end
    def booking_params
        params.require(:booking).permit(:requesting_user_id, :status, :no_of_days, :start_date)
    end
end
