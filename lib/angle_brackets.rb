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
    def html(**kwargs, &children)
      AngleBrackets::Components::Html.new(kwargs).render(&children)
    end

    def head(**kwargs, &children)
      AngleBrackets::Components::Head.new(kwargs).render(&children)
    end

    def body(**kwargs, &children)
      AngleBrackets::Components::Body.new(kwargs).render(&children)
    end
  end
end
