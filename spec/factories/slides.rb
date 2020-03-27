# frozen_string_literal: true

FactoryBot.define do
  factory :slide1, class: Slide do
    element_type_id { 1 }
    search_word { "スライドのタイトルテスト" }
    active { true }
  end
  factory :slide2, class: Slide do
    element_type_id { 2 }
    search_word { "六甲高校" }
    before_word { "" }
    after_word { "\n（2012年卒業）" }
    active { true }
  end
  factory :slide3, class: Slide do
    element_type_id { 6 }
    search_word { "英検" }
    before_word { "準2級" }
    after_word { "\n（2010年取得）" }
    active { true }
  end
  factory :slide4, class: Slide do
    element_type_id { 7 }
    search_word { "" }
    before_word { "" }
    after_word { "" }
    active { true }
  end
  factory :slide5, class: Slide do
    element_type_id { 7 }
    search_word { "英検" }
    before_word { "1級" }
    after_word { "\n（2010年取得）" }
    active { false }
  end
  factory :slide6, class: Slide do
    element_type_id { 1 }
    search_word { "スライドのタイトルテスト" }
    active { true }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test.jpg")) }
  end
  factory :slide7, class: Slide do
    element_type_id { 2 }
    search_word { "六甲高校" }
    before_word { "" }
    after_word { "\n（2012年卒業）" }
    active { true }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test1.jpg")) }
  end
  factory :slide8, class: Slide do
    element_type_id { 6 }
    search_word { "英検" }
    before_word { "準2級" }
    after_word { "\n（2010年取得）" }
    active { true }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test2.jpg")) }
  end
end
