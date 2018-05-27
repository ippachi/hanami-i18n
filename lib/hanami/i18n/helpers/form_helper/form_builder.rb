# frozen_string_literal: true

require 'hanami/helpers/form_helper/form_builder'
require 'hanami/i18n/form.rb'

module Hanami
  module Helpers
    module FormHelper
      class FormBuilder
        prepend Hanami::I18n::Form
      end
    end
  end
end
