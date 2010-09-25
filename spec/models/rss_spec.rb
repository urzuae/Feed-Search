require 'spec_helper'

describe Rss do
  before(:each) do
    @valid_attributes = {
      :url_link => "value for url_link"
    }
  end

  it "should create a new instance given valid attributes" do
    Rss.create!(@valid_attributes)
  end
end
