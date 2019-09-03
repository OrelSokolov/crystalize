module Crystalize
  module Check
    module Meta
      def include_method?(line, method)
        line.match /[ .(]?#{method}[ .)(]?/
      end

      def check_metaprogramming_methods(line)
        methods = []
        methods.each do |method|
        end
      end
    end
  end
end