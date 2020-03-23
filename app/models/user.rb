# frozen_string_literal: true

class User < ApplicationRecord
  has_many :slides
  accepts_nested_attributes_for :slides
end
