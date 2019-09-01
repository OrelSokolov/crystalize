module Crystalize
  module Transform
    module Literals
      def transform_array_literal(line)
        line.gsub '[]', '[] of RubyHash'
      end

      def transform_hash_literal(line)
        line.gsub '{}', '{} of RubyHash => RubyHash'
      end
    end
  end
end