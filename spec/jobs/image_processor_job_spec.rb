# frozen_string_literal: true

require "rails_helper"

RSpec.describe ImageProcessorJob, type: :job do
  before { common_setup }

  it "matches with enqueued job" do
    slide_show = create(:slide_show1)
    target_slides = slide_show.slides.select { |s| s.search_target? }
    ActiveJob::Base.queue_adapter = :test
    ImageProcessorJob.perform_later(target_slides)
    expect(ImageProcessorJob).to(
      have_been_enqueued.with(target_slides)
    )
  end
end
