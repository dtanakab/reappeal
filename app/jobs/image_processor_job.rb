# frozen_string_literal: true

class ImageProcessorJob < ApplicationJob
  queue_as :default

  def perform(slides)
    slide_collection = SlideCollection.new(slides)
    slide_collection.process_images
  end
end
