# Q1.
# 次の動作をする A1 class を実装する
# - "//" を返す "//"メソッドが存在すること
class A1
  define_method("//") do
    "//"
  end
end

# Q2.
# 次の動作をする A2 class を実装する
# - 1. "SmartHR Dev Team"と返すdev_teamメソッドが存在すること
# - 2. initializeに渡した配列に含まれる値に対して、"hoge_" をprefixを付与したメソッドが存在すること
# - 2で定義するメソッドは下記とする
#   - 受け取った引数の回数分、メソッド名を繰り返した文字列を返すこと
#   - 引数がnilの場合は、dev_teamメソッドを呼ぶこと
# - また、2で定義するメソッドは以下を満たすものとする
#   - メソッドが定義されるのは同時に生成されるオブジェクトのみで、別のA2インスタンスには（同じ値を含む配列を生成時に渡さない限り）定義されない

class A2
  def initialize(arr)
    arr.each do |v|
      method_name = "hoge_#{v}"
      # self は A2 クラスのインスタンスなので、それに対して特異メソッドを生やしている
      self.define_singleton_method method_name do |count|
        return dev_team unless count

        method_name * count
      end

      # A2 クラスに対してメソッドを定義している
      A2.define_method "moge_#{v}" do
        "hogeeeeee"
      end

      # A2 クラスに対して特異メソッドを定義している
      A2.define_singleton_method method_name do
        "mogeeeee"
      end
    end
  end

  def dev_team
    "SmartHR Dev Team"
  end
end

# Q3.
# 次の動作をする OriginalAccessor モジュール を実装する
# - OriginalAccessorモジュールはincludeされたときのみ、my_attr_accessorメソッドを定義すること
# - my_attr_accessorはgetter/setterに加えて、boolean値を代入した際のみ真偽値判定を行うaccessorと同名の?メソッドができること

module OriginalAccessor
  def self.included(klass)
    klass.define_singleton_method "my_attr_accessor" do |attr|
      define_method attr do
        @value
      end

      define_method "#{attr}=" do |value|
        @value = value

        if @value.is_a?(FalseClass) || @value.is_a?(TrueClass)
          self.define_singleton_method "#{attr}?" do
            @value
          end
        end
      end
    end
  end
end
