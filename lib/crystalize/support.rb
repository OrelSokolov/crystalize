module Crystalize
  module Support
    def each_cr_file_line(&block)
      Dir['./**/**/*.cr'].each do |filename|
        puts filename
        content = []
        File.readlines(filename).each do |line|
          content << yield(line)
        end
        File.open(filename, "w") { |f| content.each do |line| f << line end}
      end
    end
  end
end