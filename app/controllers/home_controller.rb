class HomeController < ApplicationController
  def home
    user_information = HTTParty.get("https://#{ENV['BASE_DOMAIN']}.pagerduty.com/api/v1/escalation_policies/on_call", {
    headers: {
      "Authorization" => "Token token=#{ENV["PAGERDUTY_TOKEN"]}",
      },
    format: :json,
    })

    @user_records = {}

    user_information["escalation_policies"].each do |record| 
    users = record['on_call']

    primary_user = users.first
    id = record["id"]

    @user_records[id] = {
      id: id,
      primary: primary_user
    }
    end
  end

  def self.find_primary_user
    "Primary User John"
  end
end