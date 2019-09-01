require "spec_helper"

describe Crystalize::Transform::PrivateMethods do
  subject { Object.new.extend(described_class) }

  lines_with_private = [
          " private ",
          "private  ;  def method; end",
          "private ;",
          "def method; end; private",
          "def method; end; private; def method; end",
      ]

  lines_without_private = [
      "",
      "  def method; end",
      "",
      "def method; end",
      "def method; end; def method; end",
  ]

  context "should find private keyword in line" do
    lines_with_private.each do |line|
      it "'#{line}'" do
        expect(subject.private_in_line?(line)).to be_truthy
      end
    end
  end

  context "should remove private keyword from line" do
    lines_with_private.each_with_index do |line, index|
      it do
        expect(subject.line_without_private(line)).to eq(lines_without_private[index])
      end
    end
  end


  it "should rename private all methods in file" do
    before = Fixtures.load('transform/private_methods/before_1.rb')
    after = Fixtures.load('transform/private_methods/before_1.rb')

    expect(after - before).to be_empty
  end
end
