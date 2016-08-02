require "rails_helper"

describe HomeController do
  render_views

  it 'should respond with a HTTP 200 status code' do
    get 'home'
    expect(response.status).to eq 200
  end

  it 'should have have content' do
    get 'home'
    expect(response.body).to include("Who's on call? V-2")
  end
end