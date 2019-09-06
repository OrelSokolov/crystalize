require "spec_helper"

describe "Ruby core extensions" do

  context "Hash" do
    it "should be like Ruby hash" do
      expect(Hash([])).to          eq({})
      expect(Hash(nil)).to         eq({})
      expect(Hash(key: :value)).to eq({key: :value})
      expect{Hash([1, 2, 3])}.to   raise_error(TypeError)
    end

    it "should be like Crystal Hash" do
      expect(Hash(Anything, Anything)).to eq(Hash)
    end
  end

  context "Array" do
    it "should be like Ruby Array" do
      expect(Array(1..5)).to eq([1, 2, 3, 4, 5])
    end

    it "should be like Crystal Array" do
      expect(Array(Anything)).to eq(Array)
    end

  end
end