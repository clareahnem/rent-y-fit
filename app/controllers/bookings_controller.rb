class BookingsController < ApplicationController
    before_action :set_item, only: [:create]
    def index
    end

    def create
    # booking request form submission
      @booking = @item.bookings.new(booking_params)
      @booking.requesting_user_id = current_user.id
      @booking.save
      redirect_to root_path, notice: "Your booking request has been sent to the owner"
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
