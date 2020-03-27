# frozen_string_literal: true

FactoryBot.define do
  factory :slide_show1, class: SlideShow do
    show_name { "test1" }
    password { "testtest" }
    encrypted_password { Devise::Encryptor.digest(SlideShow, "testtest") }
    after(:create) do |slide_show|
      contents = %i(slide1 slide2 slide3 slide4 slide5)
      contents.each do |slide|
        slide_show.slides << FactoryBot.create(slide, slide_show: slide_show)
      end
    end
  end
  factory :slide_show2, class: SlideShow do
    show_name { "test2" }
    password { "testtest" }
    encrypted_password { Devise::Encryptor.digest(SlideShow, "testtest") }
  end
  factory :slide_show3, class: SlideShow do
    show_name { "test3" }
    password { "testtest" }
    encrypted_password { Devise::Encryptor.digest(SlideShow, "testtest") }
    after(:create) do |slide_show|
      contents = %i(slide6 slide7 slide8)
      contents.each do |slide|
        slide_show.slides << FactoryBot.create(slide, slide_show: slide_show)
      end
    end
  end
end
