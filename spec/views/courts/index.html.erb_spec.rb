require 'rails_helper'

RSpec.describe "courts/index", type: :view do
  before(:each) do
    assign(:courts, [
      Court.create!(),
      Court.create!()
    ])
  end

  it "renders a list of courts" do
    render
  end
end
