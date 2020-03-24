# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User", type: :system do
  before do
  end

  it "hoge" do
    visit "/hoge"
    expect(page).to have_content "hoge"
  end
end
