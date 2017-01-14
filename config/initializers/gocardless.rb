# frozen_string_literal: true
GocardlessClient = GoCardlessPro::Client.new(
  access_token: ENV["GOCARDLESS_TOKEN"],
  environment: :sandbox
)
