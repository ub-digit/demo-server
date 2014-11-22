require 'rails_helper'

RSpec.describe DemosController, :type => :controller do
  fixtures :demos
  describe "get list" do
    it "should return list of demos" do
      get :index
      expect(json).to have_key('demos')
      expect(json['demos'].count).to eq(5)
    end
  end

  describe "get item" do
    it "should return item" do
      get :show, id: 1
      expect(json).to have_key('demo')
      expect(json['demo']).to have_key('title')
      expect(json['demo']['title']).to eq('Test title 1')
    end
  end

  describe "create item" do
    it "should create a proper item" do
      post :create, demo: {title: "New title", summary: "New summary", body: "New body"}
      expect(json).to have_key('demo')
      expect(json['demo']).to have_key('id')
      expect(Demo.count).to eq(6)
    end

    it "should give error for missing field" do
      post :create, demo: {body: "New body"}
      expect(response.status).to eq(422)
      expect(json).to have_key('errors')
      expect(Demo.count).to eq(5)
    end
  end

  describe "update item" do
    it "should update a proper item" do
      demo = Demo.find_by_id(1)
      expect(demo.title).to eq('Test title 1')
      put :update, id: 1, demo: {title: "New title"}
      expect(json).to have_key('demo')
      expect(json['demo']['title']).to eq('New title')
      expect(Demo.count).to eq(5)
      demo = Demo.find_by_id(1)
      expect(demo.title).to eq('New title')
    end
  end

  describe "delete item" do
    it "should delete an existing item" do
      expect(Demo.find_by_id(1)).to be_truthy
      delete :destroy, id: 1
      expect(Demo.find_by_id(1)).to be_falsey
    end

    it "should give 404 on missing item" do
      delete :destroy, id: 99
      expect(response.status).to eq(404)
    end
  end
end
