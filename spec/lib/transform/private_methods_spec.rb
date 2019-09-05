require "spec_helper"

describe Crystalize::Transform::Line::PrivateMethods do
  subject { Object.new.extend(described_class) }

  lines_with_private = [
          " private ",
          "private ",
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

  # context "should remove private keyword from line" do
  #   lines_with_private.each_with_index do |line, index|
  #     it do
  #       expect(subject.line_without_private(line)).to eq(lines_without_private[index])
  #     end
  #   end
  # end


  it "should rename private all methods in file" do
    before = Fixtures.load('transform/private_methods/before_1.rb').join("\n")
    after_raw = Fixtures.load('transform/private_methods/after_1.rb')

    converter = Crystalize::CodeConverter.new({}, before)
    converter.convert
    after = converter.new_content

    expect(after_raw-after).to be_empty
  end
end
