class A
  def public1
    puts "Hello from public 1"
  end

  private

  def private1

  end

  def private2

  end

  private ;

  def private3

  end

  def private4; end

  protected

  def protected1

  end

  def protected2

  end

  public

  def public2

  end
end

A.new.public1