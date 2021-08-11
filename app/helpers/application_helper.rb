module ApplicationHelper

    def select_alert_subclass(input)
        # for the alert pop-up colors
        case input
        when 'notice'
            return 'info'
        when 'success'
            return 'success'
        when 'error'
            return 'danger'
        when 'alert'
            return 'warning'
        else
            return 'info'
        end
    end

    def active_orders(bookings)
        activeorders = []
        bookings.each do |booking|
            end_date = booking.start_date.next_day(booking.no_of_days)
            if booking.start_date.past? && end_date.future? 
                activeorders.push booking
            end
        end
        return activeorders
    end

    def completed_orders(bookings)
        completedorders = []
        bookings.each do |booking|
            end_date = booking.start_date.next_day(booking.no_of_days)
            if end_date.past?
                completedorders.push booking
            end
        end
        return completedorders
    end

    def display_availability(item)
        if item.availability?
            return "Make FiT Unavailable"
        end
        return "Make FiT Available"
    end

    def total_price(booking)
        total = (booking.no_of_days * booking.item.price_per_day) + booking.item.deposit
        return total
    end
end
