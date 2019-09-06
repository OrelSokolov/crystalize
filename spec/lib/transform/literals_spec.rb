require 'spec_helper'


describe Crystalize::Transform::Line::Literals do
  subject { Object.new.extend(described_class) }

  it "should find lambdas in line" do

    strings_with_lambda = [
        "lambda[]",
        "a&.[]",
        "a[]"
    ]

    strings_with_array = [
        "a = []",
        "puts [].inspect",
        "puts []",
        "method_call [], {}",
        "def m a, b = []"
    ]

    strings_with_array.each do |s|
      expect(subject.lambda_call_in_line?(s)).to be_falsey
    end

    strings_with_lambda.each do |s|
      expect(subject.lambda_call_in_line?(s)).to be_truthy
    end

  end
end