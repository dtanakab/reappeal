# frozen_string_literal: true

require "google/apis/customsearch_v1"
require "open-uri"

class Collect < ApplicationRecord
  has_one_attached :image
  has_one :image_url

  def fetch_image_url
    searcher = Google::Apis::CustomsearchV1::CustomsearchService.new
    searcher.key = ENV["API_KEY"]
    results = searcher.list_cses(name, cx: ENV["CSE_ID"], search_type: "image", num: 1, start: 1)
    results.items[0].link
  end

  def save_image
    File.open("public/images_for_movie/#{id}.jpg", "wb") do |file|
      open(url) do |img|
        file.puts img.read
      end
    end
  end
end
