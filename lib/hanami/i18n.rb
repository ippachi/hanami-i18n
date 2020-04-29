# frozen_string_literal: true

require 'hanami/i18n/version'
require 'hanami/i18n/helpers/form'
require 'hanami/i18n/validations'

if Hanami.respond_to?(:root)
  require Hanami.root.join('config/locale.rb')
end
