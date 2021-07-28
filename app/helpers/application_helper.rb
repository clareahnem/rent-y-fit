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
end
