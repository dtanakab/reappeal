# frozen_string_literal: true

require "rails_helper"

describe "SlideAPI" do
  before do
    common_set_up
  end
  it "get index of slides" do
    get "/slide_shows/#{@visible_slide_show.id}/api/slides"
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json[1]["image"]["url"]).to eq("/uploads/slide/image/test1.jpg")
  end
end
