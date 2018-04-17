# frozen_string_literal: true

require 'hanami/i18n/version'
require 'i18n'
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

module Hanami::I18n
  module Form
    def label(content, attributes = {})
      content = I18n.t(content,
                       scope: "entity.attributes.#{@name}",
                       default: Hanami::Utils::String.capitalize(content))
      super(content, attributes)
    end
  end
end

module Hanami::I18n
  module Validation
    def errors(options = {}.freeze)
      h = super(options)
      h.each_with_object({}) do |(k1, v1), hash1|
        hash1[k1] = v1.each_with_object({}) do |(k2, v2), hash2|
          hash2[I18n.t(k2,
                       scope: "entity.attributes.#{k1}",
                       default: Hanami::Utils::String.capitalize(k2))] = v2[0]
        end
      end
    end

    def messages(options = {}.freeze)
      h = super(options)
      h.each_with_object({}) do |(k1, v1), hash1|
        hash1[k1] = v1.each_with_object({}) do |(k2, v2), hash2|
          hash2[I18n.t(k2,
                       scope: "entity.attributes.#{k1}",
                       default: Hanami::Utils::String.capitalize(k2))] = v2[0]
        end
      end
    end

    def error_messages
      hash = errors
      hash.first[1].map do |k, v|
        "#{k}#{v}"
      end
    end
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
