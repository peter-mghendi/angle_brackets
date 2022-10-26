# frozen_string_literal: true
# typed: true

require "sorbet-runtime"

require_relative "angle_brackets/version"
require_relative "angle_brackets/components/renderable"
require_relative "angle_brackets/components/html"
require_relative "angle_brackets/components/head"
require_relative "angle_brackets/components/body"
require_relative "angle_brackets/components/string_renderable"
require_relative "angle_brackets/utilities/renderable_utilities"

module AngleBrackets
  include AngleBrackets::Components

  class Error < StandardError; end

  class << self
    def html(&children)
      AngleBrackets::Components::Html.new.render(&children)
    end

    def head(&children)
      AngleBrackets::Components::Head.new.render(&children)
    end

    def body(&children)
      AngleBrackets::Components::Body.new.render(&children)
    end
  end
end
