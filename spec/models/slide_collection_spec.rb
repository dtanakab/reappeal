# frozen_string_literal: true

require "rails_helper"

RSpec.describe SlideCollection, type: :model do
  before do
    common_set_up
  end

  describe "#new" do
    context "when input some slides" do
      it "update 3 slides with images" do
        @target_slides = @slide_show.slides.select { |s| s.search_target? }
        expect {
          SlideCollection.new(@target_slides)
        }.to change { Slide.where.not(image: nil).count }.by(3)
      end
    end
    context "when input no slides" do
      it "return nothing" do
        @target_slides = create(:slide_show2).slides.select { |s| s.search_target? }
        expect {
          SlideCollection.new(@target_slides)
        }.to change { Slide.where.not(image: nil).count }.by(0)
      end
    end
  end
end
