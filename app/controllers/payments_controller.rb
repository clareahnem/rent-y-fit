class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    def success
    end

    def webhook
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        booking_id = payment.metadata.event_id
        # user_id = payment.metadata.user_id
        Order.create(booking_id: booking_id, payment_id: payment_id, receipt_url: payment.charges.data[0].receipt_url)
    end
end
