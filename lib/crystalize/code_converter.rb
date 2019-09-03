module Crystalize
  class CodeConverter
    # Checks
    include Check::Line::Literals
    # include Check::Line::PrivateMethods

    # Transforms
    include Transform::Line::Literals
    include Transform::Line::PrivateMethods

    NEWLINE_DELIMITER = "\n"

    def initialize(options, content)
      @options = options
      @content = content
      @new_content = ""
    end

    def new_content
      @new_content.join(NEWLINE_DELIMITER)
    end

    def convert
      check_by_line
      check_full

      # transform_full
      @new_content = transform_by_line
    end

    private

    def by_line &block
      new_content = []
      @content.split(NEWLINE_DELIMITER).each do |line|
        yield new_content, line
      end
      new_content
    end

    def check_by_line
      by_line do |line|

      end
    end

    def transform_by_line
      by_line do |new_content, line|
        l = line
        l = transform_array_literal(l) # if @options[:transform_array_literal]
        l = transform_hash_literal(l) # if @options[:transform_hash_literal]
        new_content << l
      end
    end

    def check_full
    end

    def transform_full
    end

  end
end