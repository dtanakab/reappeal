# frozen_string_literal: true

require "rails_helper"

RSpec.describe ScreenChannel, type: :channel do
  before { common_setup }
  let(:slide_show) { create(:slide_show3) }

  describe "subscribe" do
    context "with correct_id" do
      it "successfully subscribes" do
        subscribe(slide_show_id: slide_show.id)
        expect(subscription).to be_confirmed
        expect(subscription).to have_stream_from("screen_channel_#{slide_show.id}")
      end
    end
  end
end
