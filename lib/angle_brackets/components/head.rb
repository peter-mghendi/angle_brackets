# typed: true

module AngleBrackets
  module Components
    class Head < Renderable
      extend T::Sig

      sig { override.params(children: T.nilable(T.proc.returns(T.any(Renderable, String, Array)))).returns(String) }
      def render(&children)
        render_tag "head", &children
      end
    end
  end
end
