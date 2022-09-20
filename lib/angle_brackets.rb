# frozen_string_literal: true
# typed: true

require_relative "angle_brackets/version"

module AngleBrackets
  class Error < StandardError; end

  class << self
    def html
      "<html>#{yield}</html>"
    end

    def head
      "<head>#{yield}</head>"
    end

    def body
      "<body>#{yield}</body>"
    end
  end
end
