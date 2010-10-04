require 'spec_helper'

describe Parameter do
  before(:each) do
    @valid_attributes = {
      :main => "value for main",
      :keyword_a => "value for keyword_a",
      :keyword_b => "value for keyword_b",
      :title => "value for title"
    }
  end

  it "should create a new instance given valid attributes" do
    Parameter.create!(@valid_attributes)
  end
end
