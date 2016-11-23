require 'rails_helper'

RSpec.describe "courts/index", type: :view do
  let(:presenter) { OpenStruct.new(courts: [], markers: []) }

  before(:each) do
    assign(:presenter, presenter)
  end

  it "renders a list of courts" do
    render
  end
end
