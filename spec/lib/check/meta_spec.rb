require "spec_helper"

describe Crystalize::Check::Meta do
  subject { Object.new.extend(Crystalize::Check::Meta) }


  context "#include_method?" do
      method_calls = [
          ["puts hello world", "puts"],
          ["puts hello world", "hello"],
          ["puts hello world", "world"],
          ["puts.hello", "hello"],
          [".hello", "hello"],
          ["  .hello", "hello"],
          ["  .hello(world)", "hello"],
          ["  .hello(world)", "hello"],
          ["  .hello( world )", "hello"],
          ["  .hello(world )", "hello"],
          ["  .hello(world)", "hello"],
          ["  .hello( world )", "world"],
          ["  .hello(world )", "world"],
          ["  .hello(world)", "world"],
          ["puts hello.world", "world"],
      ]

      method_calls.each do |mc|
        it "'#{mc[0]}' should include method '#{mc[1]}'" do
          expect(subject.include_method? mc[0], mc[1]).to be_truthy
        end
      end
  end

end