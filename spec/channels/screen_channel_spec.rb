# frozen_string_literal: true

require "rails_helper"

RSpec.describe ScreenChannel, type: :channel do
  before do
    common_set_up
    stub_connection slide_show_id: @visible_slide_show.id
  end

  describe "subscribe" do
    context "with correct_id" do
      it "successfully subscribes" do
        subscribe(slide_show_id: @visible_slide_show.id)
        expect(subscription).to be_confirmed
        expect(subscription).to have_stream_from("screen_channel_#{@visible_slide_show.id}")
      end
    end
  end
end
