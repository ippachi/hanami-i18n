require_relative '../fixtures/test_helper'

RSpec.describe Hanami::I18n do
  it "has a version number" do
    expect(Hanami::I18n::VERSION).not_to be nil
  end
end
