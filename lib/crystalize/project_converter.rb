module Crystalize
  class ProjectConverter
    def initialize(files, options)
      @files = files
      @options = options
    end

    def convert
      files = @files ? Dir[@files] : []
      puts "Processing #{files.size} files"
      files.select{|f| f.end_with?(".rb") }.each do |file|
        converter =  CodeConverter.new(@options, File.read(file))
        converter.convert
        result = converter.new_content_string
        File.open(file, 'w') {|f| f.write result}
      end
      puts "Done"
    end

  end
end