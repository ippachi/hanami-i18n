require_relative '../fixtures/test_validator'
require 'byebug'

RSpec.describe TestValidator do
  let(:validator) { described_class.new(user: { post: { title: 'aa' }}) }

  it "translate error message" do
    expect(validator.validate.errors(full: true)).to eq(
      user: {:email=>["My E-mail Key!"], :post=>{:title=>["My title Format!"]}}
    )
  end
end
