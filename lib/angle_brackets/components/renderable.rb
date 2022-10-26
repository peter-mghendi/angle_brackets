# typed: true

module AngleBrackets
  module Components
    class Renderable
      extend T::Sig
      extend T::Helpers
      abstract!

      sig { abstract.params(children: T.nilable(T.proc.returns(T.any(Renderable, String, Array)))).returns(String) }
      def render(&children)
      end

      sig { params(tag: String).returns(String) }
      def render_self_closing_tag(tag)
        "<#{tag}/>"
      end

      sig { params(tag: String, children: T.nilable(T.proc.returns(T.any(Renderable, String, Array)))).returns(String) }
      def render_tag(tag, &children)
        "<#{tag}>#{AngleBrackets::Utilities::RenderableUtilities.renderable(&children).render}</#{tag}>"
      end
    end
  end
end
