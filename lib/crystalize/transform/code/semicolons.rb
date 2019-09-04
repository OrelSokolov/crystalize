module Crystalize
  module Transform
    module Code
      module Semicolons
        def transform_semicolons(code)
          code.gsub(";", "\n")
        end
      end
    end
  end
end
