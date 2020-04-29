class TestValidator
  include Hanami::Validations

  validations do
    required(:user).schema do
      required(:email) { filled? }
      required(:post).schema do
        required(:title) { filled? & format?(/asdfafd/) & size?(3..64) }
      end
    end
  end
end
