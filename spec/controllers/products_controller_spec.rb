require 'rails_helper'
require 'json'

RSpec.describe ProductsController, type: :controller do
  describe "#index" do
    describe "without params" do
      it "returns a 200" do
        get :index
        expect(response.status).to eq 200
      end
    end

    describe "with params" do
      before(:each) do
        Customer.create(first_name: "Barry")
        Order.create(status: "on its way", customer: Customer.last, created_at: "2017-01-02")
        Category.create(name: "poultry").products.create(name: "chicken", order: Order.last, created_at: "2017-01-02")
      end

      it "groups by day" do
        get :index, params: { startdate: "2017-01-01", enddate: "2017-08-01", per: "day"}
        expect(JSON.parse(response.body).first.first).to eq "2017-01-02"
        expect(JSON.parse(response.body).first[1][0]["name"]).to eq "chicken"        
      end

      it "groups by week" do
        get :index, params: { startdate: "2017-01-01", enddate: "2017-08-01", per: "week"}
        expect(JSON.parse(response.body).first.first).to eq "01"
        expect(JSON.parse(response.body).first[1][0]["name"]).to eq "chicken"        
      end

      it "groups by month" do
        get :index, params: { startdate: "2017-01-01", enddate: "2017-08-01", per: "month"}
        expect(JSON.parse(response.body).first.first).to eq "1"
        expect(JSON.parse(response.body).first[1][0]["name"]).to eq "chicken"
      end
    end
  end
end
