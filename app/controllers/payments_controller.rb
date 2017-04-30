# frozen_string_literal: true
class PaymentsController < ApplicationController
  def success
    @user_application = UserApplication.find_by_go_cardless_id(params[:redirect_flow_id])

    redirect_flow = GocardlessClient.redirect_flows.complete(
      @user_application.go_cardless_id,
      params: { session_token: "session_id_#{@user_application.id}" }
    )
    @user_application.update_attributes(mandate: redirect_flow.links.mandate,
                                        customer: redirect_flow.links.customer)
    subscription = GocardlessClient.subscriptions.create(
      params: {
        amount: @user_application.package.price,
        currency: "GBP",
        interval_unit: "monthly",
        day_of_month: Date.today.day,
        links: {
          mandate: @user_application.mandate
        },
        metadata: {
          subscription_number: "subscription_number_#{@user_application.id}"
        }
      },
      headers: {
        'Idempotency-Key': "idempotency_key_#{@user_application.id}"
      }
    )
    @user_application.update_attributes(subscription_id: subscription.id)
  rescue GoCardlessPro::ValidationError => e
    puts "---------"
    puts e.message
    puts "---------"
    puts e
    puts "---------"
  end
end
