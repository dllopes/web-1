require 'rails_helper'

RSpec.describe "purchases/index", type: :view do
  before(:each) do
    assign(:purchases, [
      Purchase.create!(
        :count => 2,
        :purchaser => nil,
        :item => nil,
        :merchant => nil
      ),
      Purchase.create!(
        :count => 2,
        :purchaser => nil,
        :item => nil,
        :merchant => nil
      )
    ])
  end

  it "renders a list of purchases" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
