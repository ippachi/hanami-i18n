# frozen_string_literal: true

module Hanami::I18n
  module Form
    # Translate form label
    #
    # override Hanami::Helpers::FormHelper::FormBuilder#label
    def label(content, attributes = {})
      content = I18n.t(content,
                       scope: "model.attributes.#{@name}",
                       default: Hanami::Utils::String.capitalize(content))
      super(content, attributes)
    end
  end
end
