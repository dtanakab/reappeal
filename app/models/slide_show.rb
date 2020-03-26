# frozen_string_literal: true

class SlideShow < ApplicationRecord
  has_many :slides
  accepts_nested_attributes_for :slides
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, authentication_keys: [:show_name]
  attr_accessor :login
  validates :show_name,
  uniqueness: { case_sensitive: :false },
  length: { minimum: 4, maximum: 20 },
  format: { with: /\A[a-z0-9]+\z/, message: "スライドショーIDは4~20文字の半角英数字です" }

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

end
