# typed: true

module AngleBrackets
  module Components
    class Renderable
      extend T::Sig
      extend T::Helpers
      abstract!

      attr_accessor :attributes

      def initialize(attributes = {})
        @attributes = attributes
      end

      sig { abstract.params(children: T.nilable(T.proc.returns(T.any(Renderable, String, Array)))).returns(String) }
      def render(&children)
      end

      sig { params(tag: String).returns(String) }
      def render_self_closing_tag(tag)
        attributes = splat_attributes @attributes
        "<#{tag} #{attributes}/>"
      end

      sig { params(tag: String, children: T.nilable(T.proc.returns(T.any(Renderable, String, Array)))).returns(String) }
      def render_tag(tag, &children)
        attributes = splat_attributes @attributes
        renderable = AngleBrackets::Utilities::RenderableUtilities.renderable(&children)
        attributes = " #{attributes}" unless attributes.empty?
        "<#{tag}#{attributes}>#{renderable.render}</#{tag}>"
      end

      sig { params(attributes: Hash, prefix: String).returns(String) }
      def splat_attributes(attributes, prefix = "")
        attributes.map do |key, value|
          if key == :data
            splat_attributes(value, "data-")
          else
            "#{prefix}#{key}=\"#{value}\""
          end
        end.flatten.join ""
      end
    end
  end
end
