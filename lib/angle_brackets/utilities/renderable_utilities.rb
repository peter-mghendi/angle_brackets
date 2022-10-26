# typed: true

module AngleBrackets
  module Utilities
    module RenderableUtilities
      extend T::Sig

      sig do
        params(children: T.nilable(T.proc.returns(T.any(AngleBrackets::Components::Renderable, String, Array))))
          .returns(AngleBrackets::Components::Renderable)
      end
      def self.renderable(&children)
        return AngleBrackets::Components::StringRenderable.new if children.nil?
        contents = yield

        if contents.is_a? AngleBrackets::Components::Renderable
          contents
        elsif contents.is_a? String
          AngleBrackets::Components::StringRenderable.new contents
        elsif contents.is_a? Array
          # HACK: Creating a StringRenderable whose contents are the joined renderables.
          # TODO: Create an ArrayRenderable that does this. Look into overriding operator methods.
          items = T.cast(contents, T::Array[T.any(AngleBrackets::Components::Renderable, String)])
          AngleBrackets::Components::StringRenderable.new(items.map { |item| renderable { item }.render }.join)
        else
          AngleBrackets::Components::StringRenderable.new
        end
      end
    end
  end
end
