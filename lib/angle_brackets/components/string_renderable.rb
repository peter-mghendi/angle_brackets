# typed: true

module AngleBrackets
  module Components
    class StringRenderable < Renderable
      extend T::Sig

      sig { params(string: String).void }
      def initialize(string = "")
        @string = string
      end

      sig { override.params(children: T.nilable(T.proc.returns(T.any(Renderable, String, Array)))).returns(String) }
      def render(&children)
        @string
      end
    end
  end
end
