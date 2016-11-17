require 'rails_helper'

RSpec.describe "courts/show", type: :view do
  before(:each) do
    @court = assign(:court, Court.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
