module Crystalize
  module Transform
    module Line
      module PrivateMethods
        def transform_private_methods(lines)
          new_lines = []

          lines.each do |line|
            current_visibility = :public

            current_visibility = :private if private_in_line?(line)
            current_visibility = :protected if protected_in_line?(line)
            current_visibility = :public if public_in_line?(line)

            if method_in_line?(line)
              # binding.pry
              new_lines << add_visibility_prefix_to_method(current_visibility, line)
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

        def add_visibility_prefix_to_method(current_visibility, line)
          " "*tabulation(line)+current_visibility.to_s + " "+ line.slice(tabulation(line), line.length)
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
          line.match /.*[ ]*(private)[ ]*/
        end

        def protected_in_line?(line)
          line.match /.*[ ]*(protected)[ ]*/
        end

        def public_in_line?(line)
          line.match /.*[ ]*(public)[ ]*/
        end
      end
    end
  end
end
