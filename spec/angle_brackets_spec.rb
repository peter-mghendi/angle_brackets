# frozen_string_literal: true
# typed: false

RSpec.describe AngleBrackets do
  it "has a version number" do
    expect(AngleBrackets::VERSION).not_to be nil
  end

  context "the html method" do
    it "should wrap the block in <html></html> tags" do
      block = AngleBrackets.html do
        [
          AngleBrackets.head { "Hello" },
          AngleBrackets.body { "Hello" }
        ]
      end
      expect(block).to eql "<html><head>Hello</head><body>Hello</body></html>"
    end
  end

  context "the head method" do
    it "should wrap the block in <head></head> tags" do
      expect(AngleBrackets.head { "Hello" }).to eql "<head>Hello</head>"
    end
  end

  context "the body method" do
    it "should wrap the block in <body></body> tags" do
      expect(AngleBrackets.body { "Hello" }).to eql "<body>Hello</body>"
    end
  end
end
