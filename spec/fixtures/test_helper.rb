class TestHelper
  include Hanami::Helpers

  def params
    {}
  end

  def form
    form_for :users, '/users' do
      label :email
    end
  end

  def nested_form
    form_for :users, '/users' do
      fields_for :post do
        fields_for :replies do
          label :body
        end
      end
    end
  end
end
