class PagesController < ApplicationController
    before_action :set_attributes, only: :dashboard
    def home

    end

    def about
    end

    def dashboard
        # all items uploaded by current user
        @items = Item.where(user_id: current_user.id)
        # all items uploaded by current user that has a pending booking request
        @requesteditems = Booking.where(status:"pending").joins(:item).where(items: {user_id: current_user.id})
        @approveditems = Booking.where(status:"approved").joins(:item).where(items: {user_id: current_user.id})
        @paidbookings = Booking.where(status:"paid").joins(:item).where(items: {user_id: current_user.id})

        @upcomingorders = @paidbookings.where("start_date >  ?", Date.today)
        
    end

    private
    def set_attributes
        # get all statuses except for status = "paid" which is at the end of array
        @statuses = Booking.statuses.keys.tap(&:pop)
    end
end
