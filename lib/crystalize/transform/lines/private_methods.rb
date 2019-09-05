module Crystalize
  module Transform
    module Line
      module PrivateMethods
        def transform_private_methods(lines)
          new_lines = []
          current_visibility = :public
          non_public_triggered = false

          lines.each do |line|
            if private_in_line?(line)
              current_visibility = :private
              non_public_triggered = true
            end
            if protected_in_line?(line)
              current_visibility = :protected
              non_public_triggered = true
            end
            current_visibility = :public if public_in_line?(line)

            if method_in_line?(line)
              new_lines << add_visibility_prefix_to_method(current_visibility, line, non_public_triggered)
            elsif private_in_line?(line) || protected_in_line?(line) || public_in_line?(line)
              new_lines << line_without_private(line)
            else
              new_lines << line
            end
          end

          new_lines
        end

        def line_without_private(line)
          ""
        end

        def add_visibility_prefix_to_method(current_visibility, line, non_public_triggered)
          if !non_public_triggered && current_visibility == :public
            line
          else
            " "*tabulation(line)+current_visibility.to_s + " "+ line.slice(tabulation(line), line.length)
          end
        end

        def tabulation(line)
          spaces_count = 0
          line.split("").each_with_index do |c, index|
            if c != " "
              spaces_count = index
              break
            end
          end
          spaces_count
        end

        def method_in_line?(line)
          line.match /[ ]*(def).*/
        end

        def private_in_line?(line)
          !!line.match(/^[ ]*(private)[ ]*/)
        end

        def protected_in_line?(line)
          !!line.match(/^[ ]*(protected)[ ]*/)
        end

        def public_in_line?(line)
          !!line.match(/^[ ]*(public)[ ]*/)
        end
      end
    end
  end
end
