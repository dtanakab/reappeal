# frozen_string_literal: true

require "google/apis/customsearch_v1"
require "open-uri"

class Collect
  def fetch_image_url(search_word)
    searcher = Google::Apis::CustomsearchV1::CustomsearchService.new
    searcher.key = ENV["API_KEY"]
    results = searcher.list_cses(search_word, cx: ENV["CSE_ID"], search_type: "image", num: 1, start: 1)
    results.items[0].link
  end

  def save_image(url)
    File.open("public/images_for_movie/#{id}.jpg", "wb") do |file|
      open(url) do |img|
        file.puts img.read
      end
    end
  end
end
