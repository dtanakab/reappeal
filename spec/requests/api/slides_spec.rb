# frozen_string_literal: true

require "rails_helper"

describe "SlideAPI" do
  before { common_setup }
  let(:slide_show) { create(:slide_show3) }

  it "get index of slides" do
    get "/slide_shows/#{slide_show.id}/api/slides"
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json[1]["image"]["url"]).to eq("/uploads/slide/image/test1.jpg")
  end
end
