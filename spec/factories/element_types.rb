# frozen_string_literal: true

FactoryBot.define do
  factory :element_type1, class: ElementType do
    id { 1 }
    column_name { "スライドショータイトル" }
  end
  factory :element_type2, class: ElementType do
    id { 2 }
    column_name { "学歴1" }
  end
  factory :element_type3, class: ElementType do
    id { 3 }
    column_name { "学歴2" }
  end
  factory :element_type4, class: ElementType do
    id { 4 }
    column_name { "職歴1" }
  end
  factory :element_type5, class: ElementType do
    id { 5 }
    column_name { "職歴2" }
  end
  factory :element_type6, class: ElementType do
    id { 6 }
    column_name { "免許/資格1" }
  end
  factory :element_type7, class: ElementType do
    id { 7 }
    column_name { "免許/資格2" }
  end
  factory :element_type8, class: ElementType do
    id { 8 }
    column_name { "趣味" }
  end
  factory :element_type9, class: ElementType do
    id { 9 }
    column_name { "特技" }
  end
end
