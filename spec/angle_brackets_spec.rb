# frozen_string_literal: true
# typed: false

RSpec.describe AngleBrackets do
  it "has a version number" do
    expect(AngleBrackets::VERSION).not_to be nil
  end

  context "the html method" do
    it "should wrap the block in <html></html> tags" do
      expect(AngleBrackets.html { "Hello" }).to eq("<html>Hello</html>")
    end
  end

  context "the head method" do
    it "should wrap the block in <head></head> tags" do
      expect(AngleBrackets.head { "Hello" }).to eq("<head>Hello</head>")
    end
  end

  context "the body method" do
    it "should wrap the block in <body></body> tags" do
      expect(AngleBrackets.body { "Hello" }).to eq("<body>Hello</body>")
    end
  end
end
