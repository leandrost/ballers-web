require 'rails_helper'

RSpec.describe "courts/new", type: :view do
  before(:each) do
    assign(:court, Court.new())
  end

  it "renders new court form" do
    render

    assert_select "form[action=?][method=?]", courts_path, "post" do
    end
  end
end
