require "rails_helper"

describe "Home", type: :request do

  it 'responds with a HTTP 200 status code' do
    get '/'
    expect(response).to have_http_status(:ok)
  end

  it 'has content' do
    get '/'
    expect(response.body).to include("Who's on call? V-2")
  end

  it 'includes an on call name' do
    allow(HomeController).to receive(:find_primary_user).and_return("Primary User Jane")
    get '/'
    expect(response.body).to include("Primary User Jane")
  end
end