require 'rails_helper'

RSpec.describe Demo, :type => :model do
  it "should save full post" do
    demo = Demo.new(title: "Test title",
                    summary: "Test summary",
                    body: "Test body",
                    url: "http://www.ub.gu.se/")
    expect(demo.save).to be_truthy
  end

  it "should require title" do
    demo = Demo.new(summary: "Test summary",
                    body: "Test body",
                    url: "http://www.ub.gu.se/")
    expect(demo.save).to be_falsey
  end

  it "should require body" do
    demo = Demo.new(title: "Test title",
                    summary: "Test summary",
                    url: "http://www.ub.gu.se/")
    expect(demo.save).to be_falsey
  end

  it "should require summary" do
    demo = Demo.new(title: "Test title",
                    body: "Test body",
                    url: "http://www.ub.gu.se/")
    expect(demo.save).to be_falsey
  end
end
