module Crystalize
  class ProjectConverter
    def initialize(options)
      @options = options
    end

    def convert
      files = @options[:files] ? Dir[@options[:files]] : []
      files.select{|f| f.ends_with?(".rb") }.each do |file|
        converter =  CodeConverter.new(@options, File.read(file))
        converter.convert
        result = converter.new_content
        File.open(file, 'w') {|f| f.write result}
      end
    end

  end
end