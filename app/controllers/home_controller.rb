class HomeController < ApplicationController

  def home



    response = HTTParty.get("https://#{ENV['BASE_DOMAIN']}.pagerduty.com/api/v1/escalation_policies/on_call", {
      headers: {
        "Authorization" => "Token token=#{ENV["PAGERDUTY_TOKEN"]}",
        },
      format: :json,
    })
  end

end