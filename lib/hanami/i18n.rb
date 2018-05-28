# frozen_string_literal: true

require 'hanami/i18n/version'
require 'hanami/i18n/entity'
require 'hanami/i18n/helpers/form_helper/form_builder'
require 'hanami/i18n/view'

::Hanami::View.configure do
  prepare do
    include Hanami::I18n::View
  end
end
