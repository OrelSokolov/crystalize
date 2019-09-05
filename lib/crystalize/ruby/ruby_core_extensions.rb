class Anything < Object; end

def Hash(*args)
  if args.all?{|arg| arg == Anything}
    Hash
  else
    args
  end
end

def Array(*args)
  if args.all?{|arg| arg == Anything}
    Array
  else
    args
  end
end
