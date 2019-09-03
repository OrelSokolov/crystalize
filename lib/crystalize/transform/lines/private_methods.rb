module Crystalize
  module Transform
    module Line
      module PrivateMethods
        def transform_private_methods(lines)
          private_triggered = false

          lines.each do |line|
            private_triggered = true if private_in_line?(line)
          end
        end

        def method_in_line?

        end

        def private_in_chunk?(chunk)
          chunk.match /.*[ ]*private[ ]*/
        end

        def private_in_line?(line)
          line.split(';').any? { |l| private_in_chunk?(l) }
        end

        def line_without_private(line)
          line.split(';').reject { |c| private_in_chunk?(c) }.join(';')
        end
      end

    end
  end
end
