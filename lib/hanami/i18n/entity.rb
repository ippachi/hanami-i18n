# frozen_string_literal: true

require 'i18n'
require 'dry/inflector'
require 'hanami/model'

module Hanami
  class Entity
    def self.t(attribute = nil)
      inflector = Dry::Inflector.new
      entity_name = inflector.singularize(inflector.tableize(name))

      if attribute
        ::I18n.t(attribute,
                 scope: "model.attributes.#{entity_name}")
      else
        ::I18n.t(entity_name,
                 scope: 'model.entities')
      end
    end
  end
end
