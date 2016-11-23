require 'rails_helper'

RSpec.describe "courts/edit", type: :view do
  before(:each) do
    @court = assign(:court, Court.create!())
  end

  xit "renders the edit court form" do
    render

    assert_select "form[action=?][method=?]", court_path(@court), "post" do
    end
  end
end
