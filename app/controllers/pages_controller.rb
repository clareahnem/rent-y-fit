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
    end

    private
    def set_attributes
        @statuses = Booking.statuses.keys
    end
end
