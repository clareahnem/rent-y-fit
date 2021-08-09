class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    before_action :authenticate_user!
    def success
        @order = Order.includes(:booking => :item).find_by_booking_id(params[:id])
        @user_address = Address.find_by(user_id: @order.booking.requesting_user_id)
    end

    def webhook
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        booking_id = payment.metadata.booking_id
        
        # user_id = payment.metadata.user_id
        # ======= create a new order ==========
        Order.create(booking_id: booking_id, payment_id: payment_id, receipt_url: payment.charges.data[0].receipt_url)

        # ======= update booking status to paid =======
        booking = Booking.find(booking_id)
        booking.update_column(:status, "paid")
    end

    def create_payment_intent
        # session for stripe payment
        booking = Booking.includes(:item).find(params[:id])
        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{
                name: booking.item.name,
                description: booking.item.description,
                amount: ((booking.item.price_per_day * booking.no_of_days) + booking.item.deposit),
                currency: 'aud',
                quantity: 1
            }],
            payment_intent_data: {
                metadata: {
                    booking_id: booking.id,
                    user_id: current_user&.id
                }
            },
            success_url: "#{root_url}/success?id=#{booking.id}",
            cancel_url: "#{root_url}/dashboard"
        )
        @session_id = session.id
    end
end
