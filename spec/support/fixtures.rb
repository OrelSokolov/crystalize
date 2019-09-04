class Fixtures
  class << self
    def load(fixture_name)
      File.read(File.join(__dir__, '../fixtures/', fixture_name)).split("\n")
    end
  end
end