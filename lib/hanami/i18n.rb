require 'hanami/i18n/version'
require 'hanami/helpers/form_helper/form_builder'

module Hanami
  module Helpers
    module FormHelper
      class FormBuilder < ::Hanami::Helpers::HtmlHelper::HtmlBuilder # rubocop:disable Metrics/ClassLength
        def label(content, attributes = {})
          content = I18n.t(content, scope: "entity.#{@name}", default: Utils::String.capitalize(content))
          super(content, attributes)
        end
      end
    end
  end
end

