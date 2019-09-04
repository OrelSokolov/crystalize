module Crystalize
  class CodeConverter
    # Checks
    include Check::Line::Literals
    # include Check::Line::PrivateMethods

    # Transforms
    include Transform::Line::Literals
    include Transform::Line::PrivateMethods
    include Transform::Code::Semicolons

    attr_reader :new_content

    NEWLINE_DELIMITER = "\n"

    def initialize(options, content)
      @options = options
      @content = transform_semicolons(content)
      @new_content = []
    end

    def new_content_string
      @new_content.join(NEWLINE_DELIMITER)
    end

    def convert
      # check_by_line
      check_full

      transform_full
      @new_content = transform_by_line(@new_content)
    end

    private

    def by_line content, &block
      new_content = []
      content.each do |line|
        yield new_content, line
      end
      new_content
    end

    def check_by_line(content)
      by_line(content) do |line|

      end
    end

    def transform_by_line(content)
      by_line(content) do |new_content, line|
        l = line
        l = transform_array_literal(l) # if @options[:transform_array_literal]
        l = transform_hash_literal(l) # if @options[:transform_hash_literal]
        new_content << l
      end
    end

    def check_full
    end

    def transform_full
      @new_content = splitted_content
      @new_content = transform_private_methods(@new_content)
    end

    def splitted_content
      @content.split(NEWLINE_DELIMITER)
    end

  end
end