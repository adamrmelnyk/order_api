require 'rails_helper'
require 'json'

RSpec.describe CustomersController, type: :controller do
  describe "#orders" do
    before(:each) do
      Customer.create(first_name: "Bob")
      Customer.create(first_name: "Barry")
      Order.create(status: "on its way", customer: Customer.last)
    end

    it "returns a 200" do
      get :orders, params: { id: 1 }
      expect(response.status).to eq 200
    end

    it "returns null for a customer without orders" do
      get :orders, params: { id: 1 }
      expect(response.body).to eq "[]"
    end

    it "returns orders for a customer with orders" do
      get :orders, params: { id: 2 }
      expect(JSON.parse(response.body).first["status"]).to eq "on its way"
    end
  end
end
