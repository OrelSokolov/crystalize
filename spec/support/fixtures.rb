class Fixtures
  class << self
    def load(fixture_name)
      File.readlines(File.join(__dir__, '../fixtures/', fixture_name))
    end
  end
end