# frozen_string_literal: true

class ImageProcessorJob < ApplicationJob
  queue_as :default

  def perform(slides)
    slide_collection = SlideCollection.new(slides)
    slide_collection.process_images
  end

  def around_cleanup
    # performの直前に何か実行
    yield
    # performの直後に何か実行
  end
end
