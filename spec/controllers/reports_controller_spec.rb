require 'spec_helper'

describe ReportsController do

  describe "GET 'daily_report'" do
    it "should be successful" do
      get 'daily_report'
      response.should be_success
    end
  end

  describe "GET 'consolidated_report'" do
    it "should be successful" do
      get 'consolidated_report'
      response.should be_success
    end
  end

end
