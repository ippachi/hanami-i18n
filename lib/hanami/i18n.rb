# frozen_string_literal: true

require 'hanami/i18n/version'
require 'i18n'
require 'hanami/i18n/form.rb'
require 'hanami/i18n/validation.rb'
require 'hanami/helpers/form_helper/form_builder'
require 'dry/validation/result'

module Hanami::I18n
  private

  def t(message, entity_name)
    I18n.t(message,
           scope: "entity.attributes.#{entity_name}",
           default: Hanami::Utils::String.capitalize(message))
  end
end

module Dry
  module Validation
    class Result
      prepend Hanami::I18n::Validation
    end
  end
end

module Hanami
  module Helpers
    module FormHelper
      class FormBuilder < ::Hanami::Helpers::HtmlHelper::HtmlBuilder
        prepend Hanami::I18n::Form
      end
    end
  end
end
