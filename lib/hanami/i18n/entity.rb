# frozen_string_literal: true

require 'i18n'
require 'dry/inflector'
require 'hanami/model'

module Hanami
  class Entity
    # Translate entity name and attribute names.
    #
    # @param attribute [Symbol] attribute name you want translate.
    #
    # @return [String] translated entity name or attribute name.
    #
    # @example
    #
    # # en:
    # #   model:
    # #     entities:
    # #       user: 'User'
    # #     attributes:
    # #       user:
    # #         name: 'Name'
    #
    # User.t # => 'User'
    # User.t(:name) # => 'Name'
    #
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
