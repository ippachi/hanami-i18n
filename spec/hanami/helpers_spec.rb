require_relative '../fixtures/test_helper'

RSpec.describe TestHelper do
  let(:helper) { described_class.new }

  describe '#form' do
    it "translates" do
      expect(helper.form.to_s).to eq(
        <<~FORM.chomp
          <form action="/users" method="POST" accept-charset="utf-8" id="users-form">
          <label for="users-email">My E-mail</label>
          </form>
        FORM
      )
    end

    it "nested form" do
      expect(helper.nested_form.to_s).to eq(
        <<~FORM.chomp
          <form action="/users" method="POST" accept-charset="utf-8" id="users-form">
          <label for="users-post-replies-body">My body</label>
          </form>
        FORM
      )
    end
  end
end
