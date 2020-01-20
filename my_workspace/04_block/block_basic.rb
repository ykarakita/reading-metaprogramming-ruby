def a_method(a, b)
  a + yield(a, b)
end

def a_method
  return yield if block_given?

  "ブロックがありません"
end
