module Crystalize
  module Transform
    module Line
      module Literals
        def transform_array_literal(line)
          line.gsub '[]', "Array(Anything).new"
        end

        def transform_hash_literal(line)
          line.gsub '{}', 'Hash(Anything, Anything).new'
        end
      end
    end
  end
end