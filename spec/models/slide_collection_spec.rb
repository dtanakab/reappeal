# frozen_string_literal: true

require "rails_helper"

RSpec.describe SlideCollection, type: :model do
  before { common_setup }
  let(:slide_show) { create(:slide_show1) }

  describe "#process_images" do
    it "update 3 slides with images" do
      target_slides = slide_show.slides.select { |s| s.search_target? }
      slide_collection = SlideCollection.new(target_slides)
      expect {
        slide_collection.process_images
      }.to change { Slide.where.not(image: nil).count }.by(3)
    end
  end
end
