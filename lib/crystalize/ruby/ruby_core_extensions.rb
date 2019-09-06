class Anything < Object; end

def Hash(*args)
  if args.all?{|arg| arg == Anything}
    Hash
  else
    if args
      if args.first == nil
        Hash.new
      elsif args.first == []
        Hash.new
      elsif args.first.instance_of?(Array) && args.first != []
        raise TypeError
      else
        args.first
      end
    else
      Hash.new
    end
  end
end


def Array(arg)
  if arg == Anything
    Array
  else
    arg.respond_to?(:to_a) ? arg.to_a : [arg]
  end
end
