# frozen_string_literal: true

require "rails_helper"

RSpec.describe "collects/show", type: :view do
  before(:each) do
    @collect = assign(:collect, Collect.create!(
                                  name: "Name",
                                  file_name: "File Name"
                                ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/File Name/)
  end
end
