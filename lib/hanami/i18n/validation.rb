# frozen_string_literal: true

require 'i18n'

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
  end
end
